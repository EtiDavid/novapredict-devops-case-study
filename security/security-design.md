# Security design

My goal was to avoid broad shared credentials and make each trust boundary testable.

| Area | Implemented approach |
| --- | --- |
| CI/CD authentication | **GitHub Actions OIDC** to Azure instead of a long-lived cloud password in workflow code |
| Azure workloads | Dedicated **user-assigned managed identities** and scoped permissions |
| Application secrets | **Key Vault**, RBAC and restricted network access; no secret values managed as Terraform state resources |
| Container supply chain | Quality/security scanning and release references pinned to immutable image digests |
| Network ingress | Cloudflare proxy and strict TLS; Azure staging direct-origin access tested as denied |
| Database | Restricted staging connectivity and separate migration responsibilities |
| Terraform | Separate state/permissions and reviewed plans before controlled apply |

I validated access in both directions: an authorised identity was able to read its intended secret, while a different workload identity was denied. **That negative test matters more than merely seeing an RBAC role assignment in the portal.**

## What is deliberately not published

No passwords, tokens, connection strings, tenant/subscription IDs, IP allowlists, internal hostnames, production Terraform state, deployment variables or copies of private workflow settings.

Security controls and the architecture evolve. This document describes the implemented staging design; it does not claim a completed independent production security certification.
