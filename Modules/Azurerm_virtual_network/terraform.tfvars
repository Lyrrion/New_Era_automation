Virtual_networks = {
    vnet-dev-001 = {
        name                = "vnet-dev-001"
        resource_group_name = "rg-dev-001"
        location            = "East US"
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