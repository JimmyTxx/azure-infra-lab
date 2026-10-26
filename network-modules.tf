module "network" {
  source = "./modules/network"

  resource_group_name = azurerm_resource_group.lab.name
  location            = azurerm_resource_group.lab.location

  vnet_name               = var.vnet_name
  vnet_address_space      = var.vnet_address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes

  nsg_name                  = var.nsg_name
  ssh_source_address_prefix = var.ssh_source_address_prefix
}