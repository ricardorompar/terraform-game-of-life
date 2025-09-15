variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "hashidemo"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "enable_ssh_key" {
  description = "Whether to create and use an SSH key for EC2 access"
  type        = bool
  default     = true
}
