mock_provider "azurerm" {}

run "nsg_security_rules" {
  command = plan

  module {
    source = "./modules/network"
  }

  variables {
    resource_group_name       = "rg-test"
    location                  = "francecentral"
    vnet_name                 = "vnet-test"
    vnet_address_space        = ["10.10.0.0/16"]
    subnet_name               = "snet-web"
    subnet_address_prefixes   = ["10.10.1.0/24"]
    nsg_name                  = "nsg-web"
    ssh_source_address_prefix = "10.0.0.0/8"
  }

  assert {
    condition = anytrue([
      for rule in azurerm_network_security_group.web.security_rule :
      rule.name == "Allow-SSH" &&
      rule.protocol == "Tcp" &&
      rule.destination_port_range == "22"
    ])

    error_message = "The NSG must contain an SSH rule on TCP port 22."
  }

  assert {
    condition = anytrue([
      for rule in azurerm_network_security_group.web.security_rule :
      rule.name == "Allow-HTTP" &&
      rule.protocol == "Tcp" &&
      rule.destination_port_range == "80"
    ])

    error_message = "The NSG must contain an HTTP rule on TCP port 80."
  }

  assert {
    condition = anytrue([
      for rule in azurerm_network_security_group.web.security_rule :
      rule.name == "Allow-SSH" &&
      rule.source_address_prefix != "*"
    ])

    error_message = "SSH must not be open to every source."
  }
}