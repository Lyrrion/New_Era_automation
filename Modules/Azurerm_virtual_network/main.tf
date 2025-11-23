resource "azurerm_virtual_network" "Vnets" {
    for_each = var.Virtual_networks
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
  dns_servers = coalesce(each.value.dns_servers, [])
  tags = local.tags

}
