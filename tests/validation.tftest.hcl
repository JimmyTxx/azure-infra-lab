mock_provider "azurerm" {}

run "reject_public_ssh" {
  command = plan

  module {
    source = "./modules/network"
  }

  variables {
    resource_group_name       = "rg-test"
    location                  = "francecentral"
    vnet_name                 = "vnet-test"
    vnet_address_space        = ["10.10.0.0/16"]
    subnet_name               = "snet-web"
    subnet_address_prefixes   = ["10.10.1.0/24"]
    nsg_name                  = "nsg-web"
    ssh_source_address_prefix = "*"
  }

  expect_failures = [
    var.ssh_source_address_prefix
  ]
}