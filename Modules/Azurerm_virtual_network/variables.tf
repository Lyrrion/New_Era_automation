variable "Virtual_networks" {
    description = "A map of virtual networks to create."
    type = map(object({
        name                = string
        resource_group_name = string
        location            = string
        address_space       = list(string)
        dns_servers         = optional(list(string))
    }))
  
}