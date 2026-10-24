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