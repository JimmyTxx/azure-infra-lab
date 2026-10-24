variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-azure-infra-lab"
}

variable "location" {
  description = "Azure region used for the lab"
  type        = string
  default     = "francecentral"
}

variable "vnet_name" {
  description = "Name of the Azure Virtual Network."
  type        = string
  default     = "vnet-azure-infra-lab"
}

variable "vnet_address_space" {
  description = "Address space of the Azure Virtual Network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the Azure subnet."
  type        = string
  default     = "snet-web"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of the Azure subnet"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "nsg_web"
}

variable "ssh_source_address_prefix" {
  description = "Source address allowed to access SSH"
  type        = string
  default     = "10.0.0.0/8"
}