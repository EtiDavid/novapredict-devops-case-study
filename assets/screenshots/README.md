# Screenshots and visual evidence

The portfolio currently includes an [architecture diagram](../architecture/architecture-diagram.svg), which is an explanatory diagram, **not a screenshot of Azure**.

The uploaded deployment journals and learning-notes PDFs describe the real tests, but **did not include reusable original GitHub Actions or Azure Portal screenshot image files** in the materials available for this review. I have not manufactured portal/dashboard screenshots or presented text reconstructions as captured evidence.

## Best screenshots to add

| Screenshot | What it would prove | Where it belongs |
| --- | --- | --- |
| GitHub Actions CI workflow result | Tests and security jobs ran | [CI/CD](../ci-cd/pipeline.md) |
| Successful staging plan / controlled apply | Reviewed Terraform change and deployment gate | [CI/CD](../ci-cd/pipeline.md) |
| Azure Container Apps revisions | Candidate and stable revision state | [CI/CD](../ci-cd/pipeline.md) |
| Azure Monitor / Log Analytics | Operational telemetry and troubleshooting | [Monitoring](../monitoring/monitoring.md) |
| Successful health check or smoke-test job | Functional release verification | [Monitoring](../monitoring/monitoring.md) |

## Publication check

Even when a screenshot has **no password**, it can still reveal tenant or subscription IDs, resource names, account emails, tokens in logs, private service URLs, or real user data. Review the entire image—including browser URL, sidebar, notifications, logs and tooltips—before publishing. Prefer cropped images showing only the result and relevant context. Never publish an image that has not been inspected.

When screenshots are available, add individually reviewed image files under `assets/screenshots/` and link each image next to the claim it supports, with a concise caption, date and environment.
