# resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
#   name                = var.name
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   sku                 = var.sku
#   instances           = var.instances
#   admin_username      = var.admin_username

#   disable_password_authentication = var.disable_password_authentication

#   dynamic "admin_ssh_key" {
#     for_each = var.admin_ssh_key != null ? [var.admin_ssh_key] : []
#     content {
#       username   = admin_ssh_key.value.username
#       public_key = admin_ssh_key.value.public_key
#     }
#   }

#   admin_password = var.disable_password_authentication ? null : var.admin_password

#   source_image_reference {
#     publisher = var.source_image_reference.publisher
#     offer     = var.source_image_reference.offer
#     sku       = var.source_image_reference.sku
#     version   = var.source_image_reference.version
#   }

#   network_interface {
#     name    = "${var.name}-nic"
#     primary = true

#     ip_configuration {
#       name                                   = "internal"
#       subnet_id                              = var.subnet_id
#       primary                                = true
#       load_balancer_backend_address_pool_ids = var.lb_backend_address_pool_ids
#     }
#   }

#   os_disk {
#     caching              = var.os_disk.caching
#     storage_account_type = var.os_disk.storage_account_type
#   }

#   upgrade_mode = var.upgrade_mode
#   tags         = var.tags
# }

# # Optional autoscale rule
# resource "azurerm_monitor_autoscale_setting" "autoscale" {
#   count               = var.enable_autoscale ? 1 : 0
#   name                = "${var.name}-autoscale"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   target_resource_id  = azurerm_linux_virtual_machine_scale_set.vmss.id

#   profile {
#     name = "defaultProfile"

#     capacity {
#       default = var.autoscale.capacity.default
#       minimum = var.autoscale.capacity.minimum
#       maximum = var.autoscale.capacity.maximum
#     }

#     rule {
#       metric_trigger {
#         metric_name        = "Percentage CPU"
#         metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
#         operator           = "GreaterThan"
#         threshold          = var.autoscale.cpu_threshold
#         time_grain         = "PT1M"
#         statistic          = "Average"
#         time_window        = "PT5M"
#       }

#       scale_action {
#         direction = "Increase"
#         type      = "ChangeCount"
#         value     = "1"
#         cooldown  = "PT2M"
#       }
#     }

#     rule {
#       metric_trigger {
#         metric_name        = "Percentage CPU"
#         metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
#         operator           = "LessThan"
#         threshold          = var.autoscale.cpu_down_threshold
#         time_grain         = "PT1M"
#         statistic          = "Average"
#         time_window        = "PT5M"
#       }

#       scale_action {
#         direction = "Decrease"
#         type      = "ChangeCount"
#         value     = "1"
#         cooldown  = "PT2M"
#       }
#     }
#   }
# }
