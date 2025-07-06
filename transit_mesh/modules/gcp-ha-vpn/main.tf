resource "google_compute_router" "router" {
  name    = var.gcp_vpn_name
  network = var.network
  region  = var.region
}

resource "google_compute_ha_vpn_gateway" "ha_vpn" {
  name    = var.gcp_vpn_name
  network = var.network
  region  = var.region
}

# Peer 1: AWS
resource "google_compute_external_vpn_gateway" "peer1" {
  name            = "peer1-external-gateway"
  redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"
  interface {
    id         = 0
    ip_address = var.peer1_vpn_public_ip
  }
}

resource "google_compute_vpn_tunnel" "peer1" {
  name                  = "peer1-tunnel"
  region                = var.region
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_vpn.id
  peer_external_gateway = google_compute_external_vpn_gateway.peer1.id
  shared_secret         = "replace-with-secure-secret"
  router                = google_compute_router.router.id
  ike_version           = 2
  bgp {
    peer_asn = var.peer1_bgp_asn
  }
}

# Peer 2: Azure
resource "google_compute_external_vpn_gateway" "peer2" {
  name            = "peer2-external-gateway"
  redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"
  interface {
    id         = 0
    ip_address = var.peer2_vpn_public_ip
  }
}

resource "google_compute_vpn_tunnel" "peer2" {
  name                  = "peer2-tunnel"
  region                = var.region
  vpn_gateway           = google_compute_ha_vpn_gateway.ha_vpn.id
  peer_external_gateway = google_compute_external_vpn_gateway.peer2.id
  shared_secret         = "replace-with-secure-secret"
  router                = google_compute_router.router.id
  ike_version           = 2
  bgp {
    peer_asn = var.peer2_bgp_asn
  }
} 