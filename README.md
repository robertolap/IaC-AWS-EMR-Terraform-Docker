# IaC-AWS-EMR-Terraform-Docker
This project aims to automate the deployment of an AWS EMR (Elastic MapReduce) cluster using Infrastructure as Code (IaC) principles with Terraform and Docker. It provides a Docker container with necessary dependencies pre-installed, including Terraform and the AWS CLI, facilitating a consistent and reproducible deployment environment. The Terraform code provisions the EMR cluster with customizable configurations, allowing users to define variables such as instance types, subnet configurations, and security groups. By automating the deployment process, this project enables efficient setup and management of data processing infrastructure on AWS, facilitating scalable and cost-effective data processing workflows.

# AWS EMR Deployment with Terraform and Docker

This repository contains code and instructions to deploy an AWS EMR (Elastic MapReduce) cluster using Terraform and Docker.

## Docker Setup

The Dockerfile provided sets up an Ubuntu image with necessary dependencies, including Terraform and the AWS CLI.

To build the Docker image, run:

```bash
docker build -t proj-terraform-image:p1 .
```

To create and run the Docker container, execute:

```bash
docker run -dit --name dsa-p1 -v ./IaC:/iac proj-terraform-image:p1 /bin/bash
```

## Terraform Configuration

The provided Terraform code provisions the EMR cluster with customizable configurations.

To initialize Terraform, run:

```bash
terraform init
```

To create the plan and save it to disk:

```bash
terraform plan -var-file config.tfvars -out terraform.tfplan
```

To apply the changes:

```bash
terraform apply -auto-approve -var-file config.tfvars
```

## SSH Access to EMR Cluster

After deployment, adjust the permissions of the private key:

```bash
chmod 400 deployer
```

Connect to the EMR cluster via SSH:

```bash
ssh -i deployer hadoop@<your-cluster-address>
```

## Cleaning Up

To destroy the infrastructure, generate and apply the destruction plan:

```bash
terraform plan -destroy -var-file config.tfvars -out terraform.tfplan
terraform apply terraform.tfplan
```

## Requirements

- Docker
- Terraform
- AWS CLI
- SSH Client

Refer to the detailed instructions within the repository for configuration details and customization options.
