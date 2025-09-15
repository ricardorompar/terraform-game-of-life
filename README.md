# Conway's Game of Life AWS Demo

This project provisions an AWS EC2 instance running a simple Conway's Game of Life web app using Terraform and Docker Compose.

## Structure
- `terraform.tf` — Terraform provider and backend config
- `variables.tf` — Input variables (prefix, instance_type)
- `networking.tf` — VPC, subnet, security group, etc.
- `compute.tf` — EC2 instance definition
- `outputs.tf` — Outputs (server URL)
- `boot.sh` — EC2 startup script
- `game-of-life-app/` — App source code (Flask + JS)

## Usage

### Local Testing
1. Go to `game-of-life-app` directory
2. Run: `docker compose up --build`
3. Open `http://localhost` in your browser

### Deploy to AWS
1. Set your AWS credentials
2. Edit variables in `variables.tf` as needed
3. Run:
   ```sh
   terraform init
   terraform apply -auto-approve
   ```
4. Find the public server URL in Terraform output

## Customization
- Change the EC2 instance type via the `instance_type` variable in `variables.tf`
- Change resource names with the `prefix` variable

## Controls in the App
- Click cells to set initial alive cells
- Zoom in/out
- Set step duration
- Start/restart simulation

## Requirements
- Terraform >= 1.3
- Docker & Docker Compose (for local testing)
- AWS account
