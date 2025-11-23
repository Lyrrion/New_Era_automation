resource "azurerm_policy_definition" "restrict_rg_location" {
  name         = "restrict-rg-location"
  display_name = "Restrict Resource Group Location"
  policy_type  = "Custom"
  mode         = "All"

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field = "type"
          equals = "Microsoft.Resources/subscriptions/resourceGroups"
        },
        {
          field = "location"
          notEquals = "australiaeast"
        }
      ]
    }
    then = {
      effect = "deny"
    }
  })

  metadata = jsonencode({
    category = "General"
  })
}

resource "azurerm_policy_assignment" "restrict_rg_location_assignment" {
  name                 = "restrict-rg-location-assignment"
  display_name         = "Restrict RG Creation to Australia East"
  scope                = data.azurerm_subscription.primary.id
  policy_definition_id = azurerm_policy_definition.restrict_rg_location.id
  description          = "Deny creation of RGs outside of Australia East region"
  enforce              = true
}
