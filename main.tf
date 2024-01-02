terraform {
  required_providers {
    source = "hashicorp/azurerm"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

locals {
  tags = {
    "environment" = var.environment
  }
}

resource "azurerm_storage_account" "storage" {
  name                          = var.storage_name
  resource_group_name           = var.resource_group_id
  location                      = var.location
  account_tier                  = "Standard"
  public_network_access_enabled = false
  account_replication_type      = var.environment == "Production" ? "GRS" : "LRS"

}