terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {

  }
  subscription_id = "281d1524-73db-440c-a1c1-c8787bc9f71b"
}