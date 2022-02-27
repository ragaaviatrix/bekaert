data "azurerm_public_ip" "aviatrix_controller_public_ip_address" {
  name                = azurerm_public_ip.aviatrix_controller_public_ip.name
  resource_group_name = "HCL_AZWEU_Network_Resources"
}
output "aviatrix_controller_public_ip_address" {
  value = data.azurerm_public_ip.aviatrix_controller_public_ip_address.ip_address
}

output "aviatrix_controller_private_ip_address" {
  value = azurerm_network_interface.aviatrix_controller_nic.private_ip_address
}
