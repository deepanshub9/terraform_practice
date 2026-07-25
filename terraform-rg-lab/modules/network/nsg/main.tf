# ==============================================================================
# Network Security Group Module
# ==============================================================================
# Purpose: Creates Azure Network Security Groups (NSG) that act as virtual
# firewalls to control inbound and outbound traffic. Includes security rules
# for HTTPS access and subnet association.
# ==============================================================================

resource "azurerm_network_security_group" "app_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

# Inbound Security Rule - Allow HTTPS
resource "azurerm_network_security_rule" "allow_https" {
  name                        = "Allow-HTTPS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.app_nsg.name
}

# Associate NSG with App Subnet
resource "azurerm_subnet_network_security_group_association" "app_assoc" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}
