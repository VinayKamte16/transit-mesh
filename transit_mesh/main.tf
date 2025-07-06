terraform {
  required_version = ">= 1.0.0"
  # backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

module "aws_tgw" {
  source   = "./modules/aws-tgw"
  tgw_name = var.tgw_name

  # Peer 1: Azure
  peer1_vpn_public_ip = module.az_vwan.vpn_public_ip
  peer1_bgp_asn       = module.az_vwan.bgp_asn

  # Peer 2: GCP
  peer2_vpn_public_ip = module.gcp_ha_vpn.vpn_public_ip
  peer2_bgp_asn       = module.gcp_ha_vpn.bgp_asn
}

module "az_vwan" {
  source    = "./modules/az-vwan"
  vwan_name = var.vwan_name

  # Peer 1: AWS
  peer1_vpn_public_ip = module.aws_tgw.vpn_public_ip
  peer1_bgp_asn       = module.aws_tgw.bgp_asn

  # Peer 2: GCP
  peer2_vpn_public_ip = module.gcp_ha_vpn.vpn_public_ip
  peer2_bgp_asn       = module.gcp_ha_vpn.bgp_asn
}

module "gcp_ha_vpn" {
  source        = "./modules/gcp-ha-vpn"
  gcp_vpn_name  = var.gcp_vpn_name
  network       = "gcp-network-placeholder"
  region        = var.gcp_region

  # Peer 1: AWS
  peer1_vpn_public_ip = module.aws_tgw.vpn_public_ip
  peer1_bgp_asn       = module.aws_tgw.bgp_asn

  # Peer 2: Azure
  peer2_vpn_public_ip = module.az_vwan.vpn_public_ip
  peer2_bgp_asn       = module.az_vwan.bgp_asn
} 