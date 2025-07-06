module "tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 3.0"

  name   = var.tgw_name
  # Add other required variables as needed
}

# Example: Create two VPN connections to peers
resource "aws_vpn_connection" "peer1" {
  transit_gateway_id = module.tgw.ec2_transit_gateway_id
  customer_gateway_id = aws_customer_gateway.peer1.id
  type = "ipsec.1"
}

resource "aws_customer_gateway" "peer1" {
  bgp_asn    = var.peer1_bgp_asn
  ip_address = var.peer1_vpn_public_ip
  type       = "ipsec.1"
  tags = {
    Name = "Peer1-CGW"
  }
}

resource "aws_vpn_connection" "peer2" {
  transit_gateway_id = module.tgw.ec2_transit_gateway_id
  customer_gateway_id = aws_customer_gateway.peer2.id
  type = "ipsec.1"
}

resource "aws_customer_gateway" "peer2" {
  bgp_asn    = var.peer2_bgp_asn
  ip_address = var.peer2_vpn_public_ip
  type       = "ipsec.1"
  tags = {
    Name = "Peer2-CGW"
  }
} 