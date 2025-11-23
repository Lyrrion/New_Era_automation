subscription_id = "3130fe23-dc28-48ba-a8e3-43702c2970a2"
tenant_id       = "c83b7e7f-8a37-4a58-b3cc-83a0b39033d0"
client_id       = ""
client_secret   = ""

resource_groups = {
  "dandeli_1" = {
    name       = "rg-QA-001"
    location   = "Australia East"
    managed_by = "Sujit Gade"

  }
  "dandeli_2" = {
    name       = "rg-qa-002"
    location   = "East US"
    managed_by = ""
  }
  dandeli_3 = {
    name     = "rg-qa-003"
    location = "Central India"
  }

}

storage_accounts = {
  storageaccountdev001 = {
    name                     = "storageaccountdev001"
    resource_group_name      = "rg-dev-001"
    location                 = "Australia East"
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
    name                     = "storageaccountdev002"
    resource_group_name      = "rg-dev-002"
    location                 = ""
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "GRS"

 
  }
}

Virtual_networks = {
    vnet-dev-001 = {
        name                = "vnet-dev-001"
        resource_group_name = "rg-dev-001"
        location            = "Australia East"
        address_space       = ["10.0.0.0/16"]
      
    }
    vnet-dev-002 = {
        name                = "vnet-dev-002"
        resource_group_name = "rg-dev-002"
        location            = "West Europe"
        address_space       = ["10.1.0.0/16"]
        dns_servers         = []
    }
    vnet-dev-003 = {
        name                = "vnet-dev-003"
        resource_group_name = "rg-dev-003"
        location            = "Central India"
        address_space       = ["10.2.0.0/16"]
        
}
}

subnets = {
  subnet1 = {
    name                 = "subnet-dev-001"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "subnet-dev-002"
    resource_group_name  = "rg-dev-001"
    virtual_network_name = "vnet-dev-001"
    address_prefixes     = ["10.0.2.0/24"]

}

}


nsgs = {
nsg1 = {
   name                = "nsg-dev-001"
   resource_group_name = "rg-dev-001"
   location            = "australia east"
   tags = {
     environment = "dev"
     project     = "project1"
   }
   security_rules = [
     {
       name                       = "allow-ssh"
       description                = "Allow SSH inbound"
       protocol                   = "Tcp"
       source_port_range          = "*"
       destination_port_range     = "22"
       source_address_prefix      = "*"
       destination_address_prefix = "*"
       access                     = "Allow"
       priority                   = 100
       direction                  = "Inbound"
     },
     {
       name                       = "deny-all-outbound"
       description                = "Deny all outbound traffic"
       protocol                   = "*"
       source_port_range          = "*"
       destination_port_range     = "*"
       source_address_prefix      = "*"
       destination_address_prefix = "*"
       access                     = "Deny"
       priority                   = 200
       direction                  = "Outbound"
     }
   ]
 }

   }
