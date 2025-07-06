// Define shared outputs here 

output "aws_vpn_connection_peer1_id" {
  value = module.aws_tgw.vpn_connection_peer1_id
}

output "aws_vpn_connection_peer2_id" {
  value = module.aws_tgw.vpn_connection_peer2_id
}

output "az_vpn_site_peer1_id" {
  value = module.az_vwan.vpn_site_peer1_id
}

output "az_vpn_site_peer2_id" {
  value = module.az_vwan.vpn_site_peer2_id
}

output "gcp_vpn_tunnel_peer1_name" {
  value = module.gcp_ha_vpn.vpn_tunnel_peer1_name
}

output "gcp_vpn_tunnel_peer2_name" {
  value = module.gcp_ha_vpn.vpn_tunnel_peer2_name
} 