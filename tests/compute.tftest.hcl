mock_provider "azurerm" {}

run "linux_vm_configuration" {
  command = plan

  assert {
    condition     = azurerm_linux_virtual_machine.web.name == "vm-web"
    error_message = "The linux VM name is incorrect."
  }

  assert {
    condition     = azurerm_linux_virtual_machine.web.admin_username == "azureadmin"
    error_message = "The linux VM admin username is incorrect."
  }

  assert {
    condition     = azurerm_linux_virtual_machine.web.disable_password_authentication == true
    error_message = "Password authentication must be disabled."
  }

  assert {
    condition     = length(nonsensitive(azurerm_linux_virtual_machine.web.custom_data)) > 0
    error_message = "cloud-init custo data must be configured."
  }
}