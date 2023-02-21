variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "my_vpc" {
  description = "this is VPC name"
  default     = "my_vpc"
  type        = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public_subnet" {
  type    = string
  default = "public_subnet"
}
variable "public_subnet_cidr" {
  type    = string
  default = "10.0.101.0/24"
}

variable "private_subnet_1" {
  type    = string
  default = "private_subnet_1"

}

variable "private_subnet_1_cidr" {
  type    = string
  default = "10.0.1.0/24"

}
variable "private_subnet_2" {
  type    = string
  default = "private_subnet_2"

}
variable "private_subnet_2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}
# variable "availability_zones" {
#   type    = list(string)
#   default = ["us-east-1a", "us-east-1b"]
# }

variable "region_number" {
  # Arbitrary mapping of region name to number to use in
  # a VPC's CIDR prefix.
  default = {
    us-east-1a = 1
    us-east-1b = 2
  }
}
