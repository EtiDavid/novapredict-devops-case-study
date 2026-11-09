# Monitoring and troubleshooting

Azure staging has a **Log Analytics workspace**, **Application Insights**, an **Azure Monitor action group**, an ingestion-cap alert and an observability workbook. Container Apps also expose revision and probe health information. These are the configured foundations; I don't claim that every possible service-level objective or alert has been implemented.

## How I investigate a problem

1. **Reproduce the symptom:** distinguish frontend HTTPS, backend requests, job processing and database failures.
2. **Check deployment state:** compare the running Container Apps revision, traffic assignment and health/readiness results against the expected release.
3. **Inspect telemetry:** review application/container logs and available Azure Monitor signals; check the relevant time window.
4. **Follow dependencies:** test the database, Redis, managed-identity secret access, DNS or TLS only when the symptom points there.
5. **Prove recovery:** rerun the original failing request or operation, then record what passed and what remains unknown.

**Example:** When WSL could not reach Microsoft Entra, comparing Windows and WSL HTTPS checks isolated the failure domain before changing security controls. [Read the case study](../incidents/02-wsl-azure-connectivity.md).

## Screenshot policy

I have deliberately left out raw Azure dashboard screenshots, logs and Terraform plans: these can expose tenant IDs, IP allowlists, service endpoints or user information. Screenshots will be added only after **manual redaction and review**. A useful screenshot must prove a specific claim, not simply show a green dashboard.
