# Multi-Cloud Transit Mesh

Welcome to the live documentation and showcase for the **Multi-Cloud Transit Mesh** project!

## Overview
This project automates the creation of a full-mesh network between AWS, Azure, and GCP using Terraform. It provisions:
- AWS Transit Gateway
- Azure Virtual WAN
- GCP Cloud Router + HA VPN
- Interconnects them with IPSec/BGP
- Monitors performance with iperf3, fping, and Grafana

## Features
- Infrastructure as Code (Terraform)
- Multi-cloud automation
- Performance monitoring
- Modular and extensible

## Architecture
![Architecture Diagram](architecture.png)

## Live Repository
[View on GitHub](https://github.com/VinayKamte16/transit-mesh)

## Sample Dashboard
![Sample Grafana Dashboard](grafana_sample.png)

## Quick Start
1. Clone the repo
2. Follow the README for setup instructions

---

*This site is generated with [GitHub Pages](https://pages.github.com/).* 