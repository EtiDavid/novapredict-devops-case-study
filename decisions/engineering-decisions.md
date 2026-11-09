# Engineering decisions and trade-offs

| Decision | Why I made it | Trade-off / limitation |
| --- | --- | --- |
| Test with local Docker Compose first | Find container, migration, service-network and health issues before paying for cloud resources | Local tests cannot prove Azure networking and managed-service behaviour |
| Separate backend, worker and migration | Different runtimes have different access and deployment needs | More release coordination and health checks |
| Use managed identity, OIDC and Key Vault | Limit long-lived credentials in workloads and CI | Requires deliberate RBAC and network testing, including denied-access tests |
| Publish immutable container digests | Deploy and roll back a known image, not a mutable tag | Coordinated four-image release metadata is needed |
| Plan first, apply with a separate human action | Review the exact infrastructure change and block destructive diffs | Slower than unattended deployment |
| Keep rollback revisions in staging | Check new code at zero traffic before promotion | Not a substitute for backward-compatible database migrations |
| Run independent drift checks | Detect out-of-band Azure changes between application releases | A detected drift still needs human investigation |
| Validate backup *content* and source | A valid backup from the wrong database gives false confidence | Restore testing adds operational effort |

My working rule is: **observe the failure, narrow the cause, make the smallest justified change, and repeat the failing test**. If the evidence identifies a failure domain but not a precise root cause, I document that limitation.
