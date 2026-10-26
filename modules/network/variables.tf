variable "resource_group_name" {
  description = "Name of the Resource Group containing the network"
  type        = string
}

variable "location" {
  description = "Azure region for network resources"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Azure Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the Azure Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the Azure subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of the Azure subnet"
  type        = list(string)
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "ssh_source_address_prefix" {
  description = "Source address allowed to access SSH"
  type        = string
}