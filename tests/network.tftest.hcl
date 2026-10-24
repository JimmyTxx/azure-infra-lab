mock_provider "azurerm" {}

run "network_default" {
  command = plan

  assert {
    condition     = azurerm_virtual_network.lab.name == "vnet-azure-infra-lab"
    error_message = "The Virtual Network name is incorrect."
  }

  assert {
    condition     = contains(azurerm_virtual_network.lab.address_space, "10.10.0.0/16")
    error_message = "The Virtual Network address space is incorrect."
  }

  assert {
    condition     = azurerm_subnet.web.name == "snet-web"
    error_message = "The subnet name is incorrect."
  }

  assert {
    condition     = contains(azurerm_subnet.web.address_prefixes, "10.10.1.0/24")
    error_message = "The subnet address prefix is incorrect."
  }

  assert {
    condition     = azurerm_subnet.web.virtual_network_name == azurerm_virtual_network.lab.name
    error_message = "The subnet is not linked to the expected Virtual Network."
  }
}