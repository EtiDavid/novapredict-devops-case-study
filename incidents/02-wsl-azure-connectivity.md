# Case study: Azure authentication failed only from WSL

**Context:** Development workstation issue during Azure staging setup; no Azure service outage was established.

**Problem.** Windows could reach the Microsoft Entra HTTPS endpoint, but the Ubuntu WSL environment could not. Azure CLI operations from WSL were blocked.

**Investigation.** I compared DNS and HTTPS results across Windows and WSL, checked routing and proxy configuration, and narrowed the failure to the WSL network path rather than the Azure subscription or application infrastructure.

**Fix.** A controlled `wsl --shutdown` and restart recreated the WSL networking state. HTTPS to Entra returned HTTP 200 and Azure CLI access recovered. No Azure resource, firewall rule or Terraform source needed changing.

**Validation.** The repository remained unchanged, the Entra endpoint was reachable from WSL, and Azure CLI could access the enabled subscription.

**Lesson.** **Failure-domain isolation is not the same as proving a low-level root cause.** The evidence supported a transient WSL networking issue, but did not prove whether NAT, host filtering, routing or another internal component was responsible. I documented that uncertainty instead of inventing a cause.
