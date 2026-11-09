# CI/CD and release process

I separated **code validation**, **image publication** and **authorised staging deployment** instead of treating a green build as proof of a healthy service.

## 1. Validate and publish

1. **Pull requests and pushes to main** trigger GitHub Actions quality, unit and security checks.
2. Container release workflows build the frontend, backend, worker and migration images and publish them to **Azure Container Registry**.
3. Releases use **immutable image digests**. A release metadata/digest update is reviewed through a pull request rather than silently changing deployed tags.

## 2. Plan and deploy staging

1. A **successful main CI run** triggers a Terraform staging plan for the exact tested commit.
2. The pipeline checks the plan for destructive or unexpected changes and uploads the plan and its metadata for review.
3. The **apply** workflow is **manually dispatched** against the approved saved plan. It does not silently re-plan infrastructure.
4. A database migration runs before application revisions are updated; deploy and smoke checks then validate service behaviour.
5. A separate scheduled **drift check** looks for Azure changes made outside Terraform.

## 3. Revision rehearsal and rollback

Dedicated staging workflows support **deploy candidate → verify → promote → rollback** for backend, frontend and worker. Candidates can start at **0% application traffic**; promotion changes the traffic weights, and rollback returns to the known-good revision. The health checks differ by workload: backend/worker candidates use internal validation, while the frontend relies on platform readiness evidence because its ingress restricts non-Cloudflare requests.

This is a **staging** rollback mechanism, not a claim that every change is zero-downtime or that a database schema can always be rolled back automatically.

## What failed and what changed

An apply job once reused an **older script from the saved plan's commit** even after a fix was merged to main. The workflow now keeps infrastructure tied to the reviewed plan while sourcing operational helper scripts from a separate current-main checkout. [Read the investigation](../incidents/03-staging-deployment-fix-not-applied.md).
