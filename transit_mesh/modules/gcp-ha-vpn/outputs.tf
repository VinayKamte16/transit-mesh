output "vpn_public_ip" {
  value = "gcp-ha-vpn-public-ip-placeholder"
}

output "bgp_asn" {
  value = "65001"
}

output "vpn_tunnel_peer1_name" {
  value = google_compute_vpn_tunnel.peer1.name
}

output "vpn_tunnel_peer2_name" {
  value = google_compute_vpn_tunnel.peer2.name
} 