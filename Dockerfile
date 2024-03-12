# Use the official Ubuntu image as base
FROM ubuntu:latest

# Maintainer of the image (optional)
LABEL maintainer="Proj_Name"

# Update system packages and install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget unzip curl git openssh-client iputils-ping

# Define the Terraform version (adjust as needed)
ENV TERRAFORM_VERSION=1.7.4

# Download and install Terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Create the /iac folder as a mount point for a volume
RUN mkdir /iac
VOLUME /iac

# Create the Downloads folder and install AWS CLI (to access AWS)
RUN mkdir Downloads && \
    cd Downloads && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Define the default command to run when the container starts
CMD ["/bin/bash"]
