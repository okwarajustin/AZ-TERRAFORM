# Terraform Variables for Azure Deployment
# This file defines the variables used in the Terraform configuration for deploying resources in Azure.
# Details are provided in terraform.tfvars.

variable "rg" {
  default = "rg-name"
}

variable "region" {
  default = "rg-region"
}

variable "location" {
  default = "vm-location"
}
variable "subscription_id" {
  default = "ID of your Azure subscription"
}

variable "vm_size" {
  default = "vm-size"
}

variable "admin_username" {
  default = "adminuser"
}

variable "admin_ssh_key" {
  default = "admin-ssh-key-path"
}

variable "address_space" {
  default = ["address-space"]
}

variable "subnet_prefix" {
  default = ["subnet-prefix"]
}

variable "vm_name" {
  default = "vm-name"
}

variable "image_publisher" {
  default = "Canonical"  # e.g., "Canonical"
}

variable "image_offer" {
  default = "0001-com-ubuntu-server-jammy"  # e.g., "0001-com-ubuntu-server-jammy"
}

variable "image_version" {
  default = "latest"  # e.g., "latest"
}

variable "source_image" {
  default = "source-image"
}