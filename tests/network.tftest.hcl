mock_provider "azurerm" {}

run "network_default" {
  command = plan

  module {
    source = "./modules/network"
  }

  variables {
    resource_group_name       = "rg-test"
    location                  = "francecentral"
    vnet_name                 = "vnet-azure-infra-lab"
    vnet_address_space        = ["10.10.0.0/16"]
    subnet_name               = "snet-web"
    subnet_address_prefixes   = ["10.10.1.0/24"]
    nsg_name                  = "nsg-web"
    ssh_source_address_prefix = "10.0.0.0/8"
  }

  assert {
    condition     = output.vnet_name == "vnet-azure-infra-lab"
    error_message = "The Virtual Network name is incorrect."
  }

  assert {
    condition     = output.subnet_name == "snet-web"
    error_message = "The subnet name is incorrect."
  }

  assert {
    condition     = contains(output.subnet_address_prefixes, "10.10.1.0/24")
    error_message = "The subnet address prefix is incorrect."
  }

}