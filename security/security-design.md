# Security design

My main principle was to **give each workload only the access it needs** and avoid credentials in source control.

| Boundary | What I implemented or verified |
| --- | --- |
| GitHub → Azure | OIDC-based login for deployment workflows rather than stored long-lived cloud login secrets |
| Runtime → Azure | User-assigned managed identities with scoped permissions |
| Secrets | Azure Key Vault with role-based access and network restrictions |
| Container images | Security checks and immutable release references |
| Public ingress | Cloudflare TLS edge; tested direct-origin denial for staging |
| Database | Separate migration responsibilities and private staging access |
| Terraform | Remote state and separate privileged/environment permissions |

For example, I tested that a workload's identity could access its intended secret and that an unrelated workload identity was denied access. These **negative tests** are useful because a successful role assignment alone doesn't prove least privilege.

**Public disclosure policy:** This repository contains no tokens, database URLs, IP allowlists, private endpoints, tenant/subscription IDs, Terraform state or copies of sensitive pipeline settings.
