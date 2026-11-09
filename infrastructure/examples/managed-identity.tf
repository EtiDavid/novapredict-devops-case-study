# Sanitized, illustrative Terraform example (not production source).
# Demonstrates a workload identity and a narrowly scoped role assignment.

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "registry_id" {
  type        = string
  description = "Resource ID of a registry selected by the deployer"
}

resource "azurerm_user_assigned_identity" "image_pull" {
  name                = "example-app-image-pull"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_role_assignment" "registry_pull" {
  scope                = var.registry_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.image_pull.principal_id
}

# This snippet omits provider/backend setup and any environment-specific
# registry ABAC conditions. It is a concept example, not a complete module.
