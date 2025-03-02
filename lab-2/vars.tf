variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  # default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  # default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  # default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  # default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
  type        = string
  # default     = "ami-05b10e08d247fb927" 
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  type        = string
  # default     = "t2.micro"
}

variable "instance_count" {
  type        = number
  default     = 1
}

variable "subnets" {
  description = "A list of subnets to create"
  type = list(object({
    name = string
    cidr_block = string
    map_public_ip_on_launch = bool
  }))
}