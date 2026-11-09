# Engineering decisions

| Decision | Why it mattered | Trade-off / lesson |
| --- | --- | --- |
| Build and test locally before Azure | Validated application/container contracts without consuming cloud resources | Local proof does not replace cloud validation |
| Keep database migrations separate | Prevent schema changes from running implicitly during every API start | Release ordering and schema compatibility need deliberate checks |
| Prefer managed identities and OIDC | Avoid long-lived cloud credentials in workloads and CI | RBAC and trust configuration need explicit positive/negative tests |
| Use immutable image identifiers | Know exactly which image a revision runs | Requires release metadata and disciplined publication |
| Separate Terraform plan from apply | A human can inspect the exact change before authorising it | Slower than automatic apply, but safer for staging infrastructure changes |
| Validate recovery rather than just backup commands | Catch wrong-source backups and incomplete restoration | Adds testing effort, but avoids false confidence |

The common approach is simple: **understand what a control is supposed to prove, test it independently, and document the limitations of the evidence.**
