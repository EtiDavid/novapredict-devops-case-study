# NovaPredict Fantasy — DevOps Case Study

**Azure · Terraform · Docker · GitHub Actions · PostgreSQL · Redis**

NovaPredict Fantasy is a football prediction application where players predict match results, earn points and compete in leagues. I work on its infrastructure, container builds, deployment automation, security and troubleshooting.

This repository is a short technical case study of work I carried out while building and operating its deployment platform. **The application source and operational infrastructure repositories remain private.** No production configuration or credentials are shared here.

## What I worked on

- Built a Terraform-managed **Azure staging platform**, with networking, container workloads and managed services.
- Containerised the frontend, API, background worker and one-off database migration workload.
- Set up GitHub Actions quality/security checks, image publication and controlled staging deployments.
- Implemented managed identities, Key Vault access controls and Cloudflare-to-Azure TLS restrictions.
- Investigated failures using logs, HTTP checks, Azure CLI, Git and database validation—not just successful deployment statuses.

## Explore the work

| Topic | What's inside |
| --- | --- |
| [Architecture](architecture/architecture.md) | Components and how they connect |
| [CI/CD](ci-cd/pipeline.md) | Build, review, deployment and rollback |
| [Terraform](infrastructure/infrastructure.md) | Infrastructure structure and a sanitized example |
| [Security](security/security-design.md) | Identities, secrets and ingress boundaries |
| [Monitoring](monitoring/monitoring.md) | Health checks and troubleshooting signals |
| [Incidents](incidents/01-wrong-database-backup.md) | A real backup validation failure |
| [Networking investigation](incidents/02-wsl-azure-connectivity.md) | Isolating a Windows/WSL connectivity problem |
| [Engineering decisions](decisions/engineering-decisions.md) | Trade-offs and what I learned |

**Scope note:** The documented Azure environment is **staging**. The public-facing application and the Azure deployment programme must not be confused with a claim that all application traffic is already served by the final Azure production architecture.

— **David Eti**
