// Define shared variables here 

variable "aws_region" {
  description = "AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}

variable "gcp_project" {
  description = "GCP project ID."
  type        = string
}

variable "gcp_region" {
  description = "GCP region."
  type        = string
  default     = "us-central1"
}

# Example variables for AWS TGW module
variable "tgw_name" {
  description = "Name for the AWS Transit Gateway."
  type        = string
  default     = "mesh-tgw"
}

# Example variables for Azure vWAN module
variable "vwan_name" {
  description = "Name for the Azure Virtual WAN."
  type        = string
  default     = "mesh-vwan"
}

# Example variables for GCP HA VPN module
variable "gcp_vpn_name" {
  description = "Name for the GCP HA VPN."
  type        = string
  default     = "mesh-ha-vpn"
} 