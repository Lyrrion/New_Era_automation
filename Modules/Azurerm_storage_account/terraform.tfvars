storage_accounts = {
  storageaccountdev001 = {
    name                     = "storageaccountdev458001"
    resource_group_name      = "rg-dev-001"
    location                 = "East US"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    https_traffic_only_enabled = true
    min_tls_version            = "TLS1_2"

    blob_properties = {
      versioning_enabled       = true
      change_feed_enabled      = true
      last_access_time_enabled = true
      delete_retention_days    = 30
    }
  }

  storageaccountdev002 = {
    name                     = "storageaccountdev0045852"
    resource_group_name      = "rg-dev-002"
    location                 = "West Europe"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    blob_properties = {
      versioning_enabled       = false
      change_feed_enabled      = false
      last_access_time_enabled = false
      delete_retention_days    = 7
    }
  }

    storageaccountdev003 = {
    name                     = "storageaccountdev003636"
    resource_group_name      = "rg-dev-002"
    location                 = "West Europe"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "GRS"

 
  }


}










