provider "azurerm" {
  features {}


variable "prefix" {
  default = "data12"
}

terraform {
  backend "azurerm" {
    resource_group_name   = "test"
    storage_account_name  = "test1se"
    container_name        = "test1"
    key                   = "terraform.tfstate"
  }
}
resource "azurerm_resource_group" "exae" {
  name     = "${var.prefix}-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
}
