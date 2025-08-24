resource "azurerm_container_registry" "containerregistry" {
  name                     = var.acr_name
  resource_group_name      = var.rg_name
  location                 = var.location
  sku                      = var.acr_sku
  admin_enabled            = var.acr_admin_enabled

  tags = var.tags
  
}

