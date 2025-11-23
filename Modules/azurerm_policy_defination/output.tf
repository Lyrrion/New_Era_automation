output "policy_definition_id" {
  value = azurerm_policy_definition.restrict_rg_location.id
}

output "policy_assignment_id" {
  value = azurerm_policy_assignment.restrict_rg_location_assignment.id
}