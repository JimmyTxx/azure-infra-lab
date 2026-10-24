mock_provider "azurerm" {}

run "nsg_security_rules" {
  command = plan

  assert {
    condition = anytrue([
      for rule in azurerm_network_security_group.web.security_rule :
      rule.name == "Allow-SSH" &&
      rule.protocol == "Tcp" &&
      rule.destination_port_range == "22"
    ])

    error_message = "The NSG must contain an SSH rule on tcp port 22."
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