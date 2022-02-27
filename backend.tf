terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "bekaert-tfstate-rg"
    storage_account_name = "bekaerttfukqrkbdl"
    container_name       = "core-tfstate"
    key                  = "bekaert.tfstate"
  }
}

