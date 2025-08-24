resource "azurerm_sql_database" "sqldatabase" {
  
name                = var.sql_database_name
  resource_group_name = var.rg_name
  location            = var.location
  server_name         = var.sql_server_name
  edition             = var.sql_edition
  requested_service_objective_name = var.sql_service_objective

  tags = var.tags
}

