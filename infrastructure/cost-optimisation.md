# Cost optimisation: sleep when idle, stay responsive when needed

**Context:** Azure staging serving the public Beta, October 2026. I used **Azure Cost Management and Azure Monitor** to decide where to reduce compute rather than simply setting every container to zero.

## What I changed

| Workload | Decision | Reason |
| --- | --- | --- |
| **Backend API** | **Scale to zero** when quiet (`min_replicas = 0`, `max_replicas = 1`); right-size from **0.5 vCPU / 1 GiB** to **0.25 vCPU / 0.5 GiB** | Pay for less compute while preserving request-driven wake-up. A **30-minute cooldown** keeps it warm through bursts. |
| **Frontend** | Keep **one small replica warm** (`min_replicas = 1`) | A cold first page can look like an outage. The small always-on cost is worth the smoother first visit. |
| **Paused UAT tool** | Explicitly **stop** the unused Container App; verify **0 running replicas** | A Terraform intent of `min_replicas = 0` had *not* stopped it in practice; the unused app was still generating charges. |
| **Background work** | Use a scheduled worker-tick **job**, not an always-on polling service | The job runs every five minutes for time-sensitive background work. Its executions **still cost money**. An older worker app is retained as a rollback target at zero replicas. |
| **Old deployment revisions** | Deactivate idle 0%-traffic revisions after safe promotion; run a cleanup guard | In multiple-revision mode, a revision at **0% traffic** can still keep a replica running and incur costs. |

## Measure, change, validate

On **9 October 2026**, Azure Cost Management showed **€9.37 month-to-date** at the time of the initial query, of which **€6.77** was attributed to Container Apps. I investigated individual apps, jobs, running replicas and CPU/memory before changing anything. Billing data can arrive late, so the later **20 October** re-query—not the original snapshot—is the better basis for comparing days.

Azure Monitor showed the backend had enough headroom to halve its CPU and memory allocation. I applied the resize through the reviewed Terraform plan/apply process and verified the deployed configuration and public smoke tests. I also found that the paused UAT app was unexpectedly still running: explicitly stopping it brought its replica count to zero, and a subsequent Terraform apply left it stopped.

The later comparison showed backend daily Container Apps cost decreasing from roughly **€0.80/day** (6–9 October) to **€0.35/day** (10–19 October), about **56% lower** across those measured windows. This is an **observed comparison**, not a controlled experiment or a guarantee of future savings: traffic and release activity can change. The UAT app's charges stopped after shutdown.

## Why not make everything sleep?

**Cost is not the only goal.** Scaling to zero can cause a cold start. I therefore kept the user-facing frontend warm while allowing the backend to sleep between quiet periods. I also kept background-job scheduling intact because it handles real product work.

The lesson I took from this was simple: **cost optimisation is about spending on what users notice and removing waste they don't**. I check actual replica behaviour and billing, not just the Terraform setting.
