resource "azurerm_resource_group" "Rgs" {
  for_each = var.resource_groups
  name     = each.value.name
  location = each.value.location
  managed_by = lookup(each.value, "managed_by", "unknown") != "" ? each.value.managed_by : null
  tags     = local.tags
}



