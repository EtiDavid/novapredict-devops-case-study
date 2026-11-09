# NovaPredict Fantasy — DevOps case study

**Azure · Terraform · Docker · GitHub Actions · PostgreSQL · Redis**

NovaPredict is a live football prediction application.

I work on its cloud infrastructure, containerisation, deployment pipelines, security and troubleshooting.

**Try the application:** [NovaPredict Fantasy — Live Beta](https://beta.novapredictfantasy.win/)

This is a **public technical case study**, not the application repository. **The application source code and operational infrastructure repositories are private.** Architecture and examples here are simplified to protect credentials and internal configuration.

## What I built and managed

- **Infrastructure:** Terraform-managed Azure staging, networking, Container Apps, PostgreSQL Flexible Server and Upstash Redis.
- **Containers and delivery:** Docker images for frontend, API, worker and migrations; GitHub Actions tests, security checks and Azure Container Registry publication.
- **Release safety:** reviewed Terraform plans, separate deployment approval, health checks, staging smoke tests and revision rollback rehearsals.
- **Security and operations:** OIDC, managed identities, Key Vault, least-privilege access, Cloudflare/TLS, Azure monitoring and incident investigation.
- **Cost optimisation:** right-sized container resources, used backend scale-to-zero, stopped unused UAT capacity and kept the frontend warm for a better first-visit experience.

## Quick reviewer path

If you only have a few minutes, these pages show the parts of the project I think best represent how I work:

1. [Architecture](architecture/architecture.md) — how the services fit together and why I separated them.
2. [CI/CD](ci-cd/pipeline.md) — how I validate, publish, deploy and rehearse rollback.
3. [Deployment incident](incidents/03-staging-deployment-fix-not-applied.md) — a real example of tracing a release problem to its source-version boundary.
4. [Security design](security/security-design.md) — OIDC, managed identities, Key Vault and least-privilege access.

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

## Related hands-on infrastructure experience

NovaPredict is my cloud-focused project. Separately, I also run an enterprise-style home lab where I build and troubleshoot infrastructure directly.

That environment includes:

- **Proxmox VE and VMware** virtualization
- **Linux and Windows Server**
- **Ansible** configuration management and automation
- **Active Directory, DNS and DHCP**
- **pfSense**, VLAN segmentation and firewall rules
- TCP/IP, routing, NAT and general network troubleshooting
- Prometheus, Grafana, Loki and Alertmanager
- PowerShell, Bash and Python for administration and automation

I use the lab to practise the same habits I use on NovaPredict: make a change deliberately, validate the result, break things safely, recover them and document what I learned.

This lab is separate from NovaPredict and is not presented here as production experience.

**Environment scope:** The documented Azure environment is my **staging platform and currently serves the public beta**. It has real users, but I do **not** present it as a finished production architecture or claim that a final production cutover is complete.

— **David Eti**
