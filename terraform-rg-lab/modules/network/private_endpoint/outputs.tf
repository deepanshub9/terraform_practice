# ==============================================================================
# Private Endpoint Outputs
# ==============================================================================

output "private_endpoint_id" {
  value       = azurerm_private_endpoint.storage_pe.id
  description = "The ID of the Private Endpoint"
}

output "private_dns_zone_name" {
  value       = azurerm_private_dns_zone.storage_dns.name
  description = "The name of the Private DNS Zone"
}

output "private_dns_zone_id" {
  value       = azurerm_private_dns_zone.storage_dns.id
  description = "The ID of the Private DNS Zone"
}
