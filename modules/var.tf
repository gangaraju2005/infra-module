variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
#   default     = "ami-0532be01f26a3de55"
  
}
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  
}
variable "subnet_cidr" {
  type        = string
  description = "CIDR block for subnet"
}

variable "subnet_az" {
  type        = string
  description = "Availability zone for subnet"
}

variable "vpc_cidr" {
    type = string
    description = "VPC configuration"
}
variable "vpc_name" {
    type = string
    description = "VPC Name"
}