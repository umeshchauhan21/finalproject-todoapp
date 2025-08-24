locals {
  commontags = {
    project = "todoapp"
  }
}

module "rg" {

  source   = "../../Module/azurerm_resource_group"
  rg_name  = "rg-dev"
  location = "central india"
  tags     = local.commontags

}

module "stg" {
  depends_on               = [module.rg]
  source                   = "../../Module/Azurerm_storageaccount"
  storage_account_name     = "stgdev202508"
  rg_name                  = "rg-dev"
  location                 = "central india"
  tags                     = local.commontags
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

module "sqlserver" {
  depends_on      = [module.rg]
  source          = "../../Module/Azurerm_sqlserver"
  sql_server_name = "sqlserverdev202508"
  rg_name         = "rg-dev"
  location        = "central india"
  tags            = local.commontags
  admin_username  = "sqlusername"
  admin_password  = "admin@123456"
  sql_version     = "12.0"

}
module "sqldatabase" {
  depends_on            = [module.sqlserver, module.rg]
  source                = "../../Module/Azurerm_sqldb"
  sql_database_name     = "sqldbdev202508"
  sql_server_name       = "sqlserverdev202508"
  rg_name               = "rg-dev"
  location              = "central india"
  tags                  = local.commontags
  sql_service_objective = "S0"
  sql_edition           = "Standard"

}

module "aks" {
  depends_on = [module.rg]
  source     = "../../Module/azurerm_aks"
  aks_name   = "aksdev202508"
  rg_name    = "rg-dev"
  location   = "central india"

  tags       = local.commontags
  dns_prefix = "aksdev202508"
  node_count = 1
  vm_size    = "Standard_DS2_v2"

}