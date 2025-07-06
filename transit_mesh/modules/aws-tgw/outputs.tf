output "vpn_public_ip" {
  value = "aws-tgw-public-ip-placeholder"
}

output "bgp_asn" {
  value = "64512"
}

output "vpn_connection_peer1_id" {
  value = aws_vpn_connection.peer1.id
}

output "vpn_connection_peer2_id" {
  value = aws_vpn_connection.peer2.id
}

output "customer_gateway_peer1_id" {
  value = aws_customer_gateway.peer1.id
}

output "customer_gateway_peer2_id" {
  value = aws_customer_gateway.peer2.id
} 