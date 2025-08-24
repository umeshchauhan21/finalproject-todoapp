resource "azurerm_sql_server" "sqlserver" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  tags = var.tags
}

