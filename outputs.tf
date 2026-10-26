output "resource_group_name" {
  description = "Name of the Resource Group"
  value       = azurerm_resource_group.lab.name
}

output "resource_group_location" {
  description = "Location of the Resource Group"
  value       = azurerm_resource_group.lab.location
}

output "vnet_name" {
  description = "Name of the Azure Virtual Network"
  value       = module.network.vnet_name
}

output "subnet_name" {
  description = "Name of the Azure subnet"
  value       = module.network.subnet_name
}

output "subnet_address_prefixes" {
  description = "Address prefixes of the Azure subnet"
  value       = module.network.subnet_address_prefixes
}

output "vm_name" {
  description = "Name of the Linux virtual machine"
  value       = azurerm_linux_virtual_machine.web.name
}

output "public_ip_address" {
  description = "Public IP address of the Linux virtual machine"
  value       = azurerm_public_ip.web.ip_address
}

output "nic_name" {
  description = "Name of the network interface"
  value       = azurerm_network_interface.web.name
}