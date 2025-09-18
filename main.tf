terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
    subscription_id = "1a513728-32d9-4795-a566-4268cebdcbfd"
    client_id = "8d77bb8c-11a4-4de0-b1f9-09ce0abb97bd"
    client_secret = "Q~g8Q~kfpewGIzBAqbvdYQYpQK6Ta7GcPWGbPbqc"
    tenant_id = "27f0e9e7-8e01-4bf3-8bb6-141562da3ded"
    
}

# Create a resource group
resource "azurerm_resource_group" "gnrg" {
  name     = "${var.rgname}"
  location = "${var.rglocation}"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet}"
  resource_group_name = azurerm_resource_group.gnrg.name
  location            = azurerm_resource_group.gnrg.location
  address_space       = ["${var.vnet_cidr_prefix}"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.subnet}"
  resource_group_name  = azurerm_resource_group.gnrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.subnet_cidr_prefix}"]
}