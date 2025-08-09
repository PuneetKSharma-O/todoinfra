terraform {
  required_version = ">= 1.4.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
   backend "azurerm" {
    resource_group_name  = "test"
    storage_account_name = "teststg1990"
    container_name       = "test"
    key                  = "test"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "8470e0441-3f52-4fdf-8fc5-508cd114ccbc"
}