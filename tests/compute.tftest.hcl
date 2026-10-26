mock_provider "azurerm" {

  mock_resource "azurerm_subnet" {
    defaults = {
      id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/rg-azure-infra-lab/providers/Microsoft.Network/virtualNetworks/vnet-azure-infra-lab/subnets/snet-web"
    }
  }

  mock_resource "azurerm_public_ip" {
    defaults = {
      id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/rg-azure-infra-lab/providers/Microsoft.Network/publicIPAddresses/pip-web"
    }
  }

  mock_resource "azurerm_network_security_group" {
    defaults = {
      id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/rg-azure-infra-lab/providers/Microsoft.Network/networkSecurityGroups/nsg-web"
    }
  }

  mock_resource "azurerm_network_interface" {
    defaults = {
      id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/rg-azure-infra-lab/providers/Microsoft.Network/networkInterfaces/nic-web"
    }
  }
}

run "linux_vm_configuration" {
  command = apply

  assert {
    condition     = azurerm_linux_virtual_machine.web.name == "vm-web"
    error_message = "The Linux VM name is incorrect."
  }

  assert {
    condition     = azurerm_linux_virtual_machine.web.admin_username == "azureadmin"
    error_message = "The Linux VM admin username is incorrect."
  }

  assert {
    condition     = azurerm_linux_virtual_machine.web.disable_password_authentication == true
    error_message = "Password authentication must be disabled."
  }

  assert {
    condition     = length(nonsensitive(azurerm_linux_virtual_machine.web.custom_data)) > 0
    error_message = "cloud-init custom data must be configured."
  }

  assert {
    condition = strcontains(
      base64decode(
        nonsensitive(
          azurerm_linux_virtual_machine.web.custom_data
        )
      ),
      "nginx"
    )

    error_message = "cloud-init must configure Nginx."
  }

  assert {
    condition = azurerm_network_interface.web.ip_configuration[0].subnet_id == module.network.subnet_id

    error_message = "The network interface must be connected to the web subnet."
  }

  assert {
    condition = azurerm_network_interface.web.ip_configuration[0].public_ip_address_id == azurerm_public_ip.web.id

    error_message = "The Public IP must be connected to the network interface."
  }

  assert {
    condition = contains(
      azurerm_linux_virtual_machine.web.network_interface_ids,
      azurerm_network_interface.web.id
    )

    error_message = "The Linux VM must use the expected network interface."
  }
}