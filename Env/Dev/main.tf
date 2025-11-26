module "resource_group" {
  source          = "../../Modules/Azurerm_resource_group"
  resource_groups = var.resource_groups
}


module "storage" {
  depends_on = [ module.resource_group ]
  source           = "../../Modules/Azurerm_storage_account"
  storage_accounts = var.storage_accounts

}

# module "vnet" {
#   depends_on = [ module.resource_group,module.storage ]
#   source        = "../Modules/Azurerm_virtual_network"
#   Virtual_networks  = var.Virtual_networks
# }

# module "subnets" {
#   depends_on = [ module.vnet ]
#   source        = "../Modules/Azurerm_subnet"
#   subnets  = var.subnets
  
# }

# module "nsg" {
#   depends_on = [ module.resource_group ]
#   source        = "../Modules/Azurerm_network_security_group"
#   nsgs  = var.nsgs
# }