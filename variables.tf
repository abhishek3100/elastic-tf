variable "project_id" {
  type        = string
  description = "Id of the project all resources go under"
  default     = "abhishekx"
}

variable "region" {
  type        = string
  description = "GCP region for the resources"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "GCP zones for the resources"
  default     = "us-central1-a"
}

variable "env" {
  default = "dev"
}

variable "instance_name" {
  type        = string
  description = "Name of your instance"
  default     = "dev-elasticsearch"
}

variable "machine_type" {
  type        = string
  description = "VM machine type for instance"
  default     = "n1-standard-2"
}

variable "image" {
  type        = string
  description = "Boot disk image"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "size" {
  type        = number
  description = "Boot disk size"
  default     = 10
}

variable "vpc_name" {
  type        = string
  description = "Under which VPC instance will be created"
  default     = "default"
}

variable "firewall_name" {
  type        = string
  description = "Firewall associated with instance"
  default     = "elasticsearch"
}
