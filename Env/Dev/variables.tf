variable "subscription_id" {
  description = "The Subscription ID for the Azure account."
  type        = string

}

variable "tenant_id" {
  description = "The Tenant ID for the Azure account."
  type        = string

}

variable "client_id" {
  description = "The Client ID for the Azure account."
  type        = string

}

variable "client_secret" {
  description = "The Client Secret for the Azure account."
  type        = string

}

variable "resource_groups" {
  description = "A map of resource groups to create."
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))

}

variable "allowed_locations" {
  description = "The list of allowed locations for resources."
  type        = list(string)
  default     = ["australiaeast"]
}

variable "storage_accounts" {
  description = "A map of storage accounts to create, with optional blob properties for each."
  type = map(object({
    # --- Required fields ---
    name                     = string
    resource_group_name      = string
    location                 = string
    account_kind             = string
    account_tier             = string
    account_replication_type = string

    # --- Optional fields ---
    https_traffic_only_enabled        = optional(bool)
    min_tls_version                   = optional(string)
    shared_access_key_enabled         = optional(bool)
    public_network_access_enabled     = optional(bool)
    default_to_oauth_authentication   = optional(bool)
    large_file_share_enabled          = optional(bool)
    infrastructure_encryption_enabled = optional(bool)
    dns_endpoint_type                 = optional(string)

    # --- Optional nested blob properties ---
    blob_properties = optional(object({
      versioning_enabled       = optional(bool)
      change_feed_enabled      = optional(bool)
      last_access_time_enabled = optional(bool)
      delete_retention_days    = optional(number)
    }))
  }))
}

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

variable "subnets" {
    description = "A map of subnets to create."
    type = map(object({
        name                 = string
        resource_group_name  = string
        virtual_network_name = string
        address_prefixes     = list(string)
    }))
  
}


  variable "nsgs" {
  description = "NSG configuration with optional and required fields"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    security_rules      = optional(list(object({
      name                                    = string
      description                             = optional(string)
      protocol                                = string
      source_port_range                        = optional(string)
      source_port_ranges                       = optional(list(string))
      destination_port_range                   = optional(string)
      destination_port_ranges                  = optional(list(string))
      source_address_prefix                    = optional(string)
      source_address_prefixes                  = optional(list(string))
      source_application_security_group_ids    = optional(list(string))
      destination_address_prefix               = optional(string)
      destination_address_prefixes             = optional(list(string))
      destination_application_security_group_ids = optional(list(string))
      access                                  = string
      priority                                = number
      direction                               = string
    })), [])
  }))
} 