# NovaPredict Fantasy — DevOps case study

**Azure · Terraform · Docker · GitHub Actions · PostgreSQL · Redis**

NovaPredict is a live football prediction application.

I work on its cloud infrastructure, containerisation, deployment pipelines, security and troubleshooting.

**Try the application:** [NovaPredict Fantasy — Live Beta](https://beta.novapredictfantasy.win/register)

This is a **public technical case study**, not the application repository. **The application source code and operational infrastructure repositories are private.** Architecture and examples here are simplified to protect credentials and internal configuration.

## What I built and managed

- **Infrastructure:** Terraform-managed Azure staging, networking, Container Apps, PostgreSQL Flexible Server and Upstash Redis.
- **Containers and delivery:** Docker images for frontend, API, worker and migrations; GitHub Actions tests, security checks and Azure Container Registry publication.
- **Release safety:** reviewed Terraform plans, separate deployment approval, health checks, staging smoke tests and revision rollback rehearsals.
- **Security and operations:** OIDC, managed identities, Key Vault, least-privilege access, Cloudflare/TLS, Azure monitoring and incident investigation.
- **Cost optimisation:** right-sized container resources, used backend scale-to-zero, stopped unused UAT capacity and kept the frontend warm for a better first-visit experience.

## Explore the case study

| Area | What it shows |
| --- | --- |
| [Architecture](architecture/architecture.md) | Service diagram, traffic flows and environment scope |
| [CI/CD](ci-cd/pipeline.md) | Tests, artifact publication, plan/apply and revision rollback |
| [Infrastructure](infrastructure/infrastructure.md) | Terraform approach and a [sanitized example](infrastructure/examples/managed-identity.tf) |
| [Security](security/security-design.md) | Identity, secret and network boundaries |
| [Monitoring](monitoring/monitoring.md) | Logs, health checks and troubleshooting |
| [Cost and efficiency](infrastructure/cost-optimisation.md) | Scale-to-zero, measured right-sizing and the availability trade-off |
| [Engineering decisions](decisions/engineering-decisions.md) | Why I made key design choices |
| [Backup incident](incidents/01-wrong-database-backup.md) | A valid backup from the wrong database |
| [Networking incident](incidents/02-wsl-azure-connectivity.md) | Windows/WSL Azure connectivity isolation |
| [Deployment incident](incidents/03-staging-deployment-fix-not-applied.md) | Fixing a stale-script deployment workflow |

**Environment scope:** The architecture below describes my **Azure staging** implementation. The public application has real users, but this portfolio does **not** claim that its final Azure production cutover is complete.

— **David Eti**
