module "vwan" {
  source  = "claranet/azurerm-virtual-wan/azurerm"
  version = "~> 6.0"

  name   = var.vwan_name
  # Add other required variables as needed
}

# Example: Create two VPN sites for AWS and GCP peers
resource "azurerm_vpn_site" "peer1" {
  name                = "peer1-site"
  resource_group_name = module.vwan.resource_group_name
  virtual_wan_id      = module.vwan.virtual_wan_id
  location            = module.vwan.location

  link {
    name          = "peer1-link"
    ip_address    = var.peer1_vpn_public_ip
    provider_name = "peer1"
    bgp {
      asn = var.peer1_bgp_asn
    }
  }
}

resource "azurerm_vpn_site" "peer2" {
  name                = "peer2-site"
  resource_group_name = module.vwan.resource_group_name
  virtual_wan_id      = module.vwan.virtual_wan_id
  location            = module.vwan.location

  link {
    name          = "peer2-link"
    ip_address    = var.peer2_vpn_public_ip
    provider_name = "peer2"
    bgp {
      asn = var.peer2_bgp_asn
    }
  }
} 