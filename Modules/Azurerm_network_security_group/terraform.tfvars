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