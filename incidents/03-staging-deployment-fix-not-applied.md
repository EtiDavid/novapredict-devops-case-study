# Case study: a deployment fix that did not reach the running workflow

**Context:** Azure staging release automation. This was a deployment investigation, not a confirmed production-user outage.

## Problem and impact
A staging database-migration step still failed after the supporting script had been corrected on `main`. Rerunning the workflow with the same saved Terraform plan did not pick up the fix. This blocked that staging release attempt.

## Investigation
I traced the workflow's source checkouts and the plan/apply relationship. The apply job intentionally checked out the **commit used to generate the reviewed plan** so it could apply that exact approved infrastructure change. That also meant its operational migration script came from the older checkout, despite a newer fix having been merged.

## Root cause
**Source-version mismatch:** a saved-plan deployment replayed the older commit's operational script. Re-running the same plan ID was not equivalent to using the latest deployment helper code.

## Change and validation
The staging apply workflow was changed to check out current `main` separately for the operational helper script, while still checking out the **original planned commit** and applying the **saved reviewed plan** for infrastructure changes. The two responsibilities now have explicit source boundaries.

The private workflow records this failure and its correction. The important validation is that the script selected for migration comes from the dedicated current-`main` checkout, whereas Terraform still uses the reviewed plan. This description does **not** claim that every migration or future release is guaranteed to succeed.

## Lesson
A successful code fix is useless if the running job uses old code. In release automation I check **which commit supplies each script and artifact**, not just whether a fix exists on `main`. I also keep the review boundary intact when fixing automation.
