
resource "azurerm_storage_account" "main" {
    for_each = var.storage_accounts
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = coalesce(each.value.location, "westeurope")
  account_kind             = each.value.account_kind
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  https_traffic_only_enabled        = each.value.https_traffic_only_enabled
  min_tls_version                   = each.value.min_tls_version
  shared_access_key_enabled         = each.value.shared_access_key_enabled
  public_network_access_enabled     = each.value.public_network_access_enabled
  default_to_oauth_authentication   = each.value.default_to_oauth_authentication
  large_file_share_enabled          = lookup(each.value, "large_file_share_enabled", false)
  infrastructure_encryption_enabled = each.value.infrastructure_encryption_enabled 
  dns_endpoint_type                 = each.value.dns_endpoint_type
  tags = local.tags

  dynamic "blob_properties" {
    for_each = each.value.blob_properties != null ? [each.value.blob_properties] : []
    content {
      versioning_enabled           = lookup(blob_properties.value, "versioning_enabled", false)
      change_feed_enabled          = lookup(blob_properties.value, "change_feed_enabled", false)
      last_access_time_enabled     = lookup(blob_properties.value, "last_access_time_enabled", false)
      delete_retention_policy {
        days = try(blob_properties.value.delete_retention_days, 7)
      }
    }
  }
}

