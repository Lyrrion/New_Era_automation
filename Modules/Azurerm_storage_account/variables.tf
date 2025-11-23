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
    https_traffic_only_enabled        = optional(bool)
    min_tls_version                   = optional(string)
    shared_access_key_enabled         = optional(bool)
    public_network_access_enabled     = optional(bool)
    default_to_oauth_authentication   = optional(bool)
    large_file_share_enabled          = optional(bool)
    infrastructure_encryption_enabled = optional(bool)
    dns_endpoint_type                 = optional(string)

   
    blob_properties = optional(object({
      versioning_enabled       = optional(bool)
      change_feed_enabled      = optional(bool)
      last_access_time_enabled = optional(bool)
      delete_retention_days    = optional(number)
    }))
  }))
}