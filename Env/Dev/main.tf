module "resource_group" {
  source          = "../../Modules/Azurerm_resource_group"
  resource_groups = var.resource_groups
}


module "storage" {
  depends_on = [ module.resource_group ]
  source           = "../../Modules/Azurerm_storage_account"
  storage_accounts = var.storage_accounts

}


##new removed 