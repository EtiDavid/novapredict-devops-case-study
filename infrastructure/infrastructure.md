# Infrastructure as Code

I use **Terraform** to manage the Azure deployment foundation and staging resources. The private project separates bootstrap/shared concerns from environment-specific configuration and reusable modules.

Examples of the infrastructure managed include Azure Container Apps, networking, identities, Key Vault, PostgreSQL, monitoring and related role assignments.

## Practices I used

- **Remote Terraform state:** keep shared infrastructure state outside the local workstation and control which deployment identities can read/write it.
- **Modules and naming:** reuse consistent resource patterns rather than manually recreating resources.
- **Environment boundaries:** isolate staging permissions and configuration from production and privileged bootstrap state.
- **Plan before apply:** produce a reviewable plan and block destructive changes before a separately approved apply.
- **Drift checks:** periodically compare Azure's actual resources with the Terraform configuration.

## Example

[Sanitized Terraform example](examples/managed-identity.tf) shows the basic style without copying live names, resource IDs, network rules, credentials or state.

The example is **illustrative**, not a drop-in recreation of NovaPredict's private deployment.
