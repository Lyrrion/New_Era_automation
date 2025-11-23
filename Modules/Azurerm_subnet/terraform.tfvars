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