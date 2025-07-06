variable "gcp_vpn_name" {
  description = "Name for the GCP HA VPN."
  type        = string
}

variable "network" {
  description = "VPC network for the VPN."
  type        = string
}

variable "region" {
  description = "Region for the VPN resources."
  type        = string
}

variable "peer_vpn_public_ip" {
  description = "Peer VPN gateway public IP"
  type        = string
  default     = ""
}

variable "peer_bgp_asn" {
  description = "Peer BGP ASN"
  type        = string
  default     = ""
}

variable "peer1_vpn_public_ip" {
  description = "Peer 1 VPN gateway public IP"
  type        = string
  default     = ""
}

variable "peer1_bgp_asn" {
  description = "Peer 1 BGP ASN"
  type        = string
  default     = ""
}

variable "peer2_vpn_public_ip" {
  description = "Peer 2 VPN gateway public IP"
  type        = string
  default     = ""
}

variable "peer2_bgp_asn" {
  description = "Peer 2 BGP ASN"
  type        = string
  default     = ""
} 