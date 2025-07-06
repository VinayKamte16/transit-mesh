output "vpn_public_ip" {
  value = "az-vwan-public-ip-placeholder"
}

output "bgp_asn" {
  value = "65515"
}

output "vpn_site_peer1_id" {
  value = azurerm_vpn_site.peer1.id
}

output "vpn_site_peer2_id" {
  value = azurerm_vpn_site.peer2.id
} 