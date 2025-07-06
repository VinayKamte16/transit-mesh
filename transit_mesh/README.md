# Multi-Cloud Transit-Mesh in IaC

This project provisions a multi-cloud network mesh using Infrastructure as Code (IaC) with Terraform. It automates the deployment and interconnection of:

- **AWS Transit Gateway (TGW)**
- **Azure Virtual WAN (vWAN)**
- **GCP Cloud Router**

The solution stitches these together using IPSec, Direct Connect, or L3VPN, and publishes latency/bandwidth graphs. Teardown is supported with a single command.

## Project Structure
- `aws/` - AWS-specific Terraform modules and configs
- `azure/` - Azure-specific Terraform modules and configs
- `gcp/` - GCP-specific Terraform modules and configs
- `modules/` - Shared Terraform modules
- `monitoring/` - Scripts and configs for monitoring/graphing
- `main.tf` - Root Terraform configuration

## Getting Started
1. Install [Terraform](https://www.terraform.io/downloads.html)
2. Configure credentials for AWS, Azure, and GCP
3. Initialize and apply Terraform:
   ```sh
   terraform init
   terraform apply
   ```
4. To destroy all resources:
   ```sh
   terraform destroy
   ```

## Status
- [ ] AWS, Azure, GCP provisioning
- [ ] Interconnectivity (IPSec/Direct Connect/L3VPN)
- [ ] Monitoring & Graphs
- [ ] One-command teardown 