output "vnet_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = azurerm_subnet.web.name
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = azurerm_subnet.web.id
}

output "subnet_address_prefixes" {
  description = "Address prefixes of the subnet"
  value       = azurerm_subnet.web.address_prefixes
}

output "nsg_id" {
  description = "ID of the Network Security Group"
  value       = azurerm_network_security_group.web.id
}