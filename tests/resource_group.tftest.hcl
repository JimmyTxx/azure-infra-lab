mock_provider "azurerm" {}

run "resource_group_default" {
  command = plan

  assert {
    condition     = azurerm_resource_group.lab.name == "rg-azure-infra-lab"
    error_message = "The Resource Group name is incorrect."
  }

  assert {
    condition     = azurerm_resource_group.lab.location == "francecentral"
    error_message = "The Resource Group location is incorrect."
  }
}

run "resource_group_custom_values" {
  command = plan

  variables {
    resource_group_name = "rg-custom-test"
    location            = "westeurope"
  }

  assert {
    condition     = azurerm_resource_group.lab.name == "rg-custom-test"
    error_message = "The custom Resource Group was not applied."
  }

  assert {
    condition     = azurerm_resource_group.lab.location == "westeurope"
    error_message = "The custom Azure location was not applied."
  }
}