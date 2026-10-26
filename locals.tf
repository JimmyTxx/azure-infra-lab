locals {
  project_name = "azure-infra-lab"

  common_tags = {
    Project     = local.project_name
    Environment = "lab"
    ManagedBy   = "Terraform"
  }

  Environment_tags = {
    Environment = "lab"
  }

  all_tags = merge(
    local.common_tags,
    local.Environment_tags
  )

  allowed_ports = [22, 80]

  allowed_port_names = [
    for port in local.allowed_ports :
    "tcp-${port}"
  ]
}