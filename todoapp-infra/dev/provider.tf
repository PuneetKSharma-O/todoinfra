terraform {
  required_version = ">= 1.4.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""

  }
}

provider "azurerm" {
  features {}
  subscription_id = "8470e0441-3f52-4fdf-8fc5-508cd114ccbc"
}