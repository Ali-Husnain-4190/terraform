variable "aws_region" {
  description = "default of region is virginia "
  type        = string

  default = "us-east-1"
}
variable "key_pair" {
  description = "AWS key pair which assiciate with Ec2 instance"
  type        = string
  default     = "demo.pem"
}
variable "instance_type_list" {
  description = "Ec2 instance type"
  type        = list(string)
  default     = ["t2.micro", "t3.micro"]
}

variable "instance_type_map" {
  description = "Ec2 instance type with map"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "prod" = "t3.micro"
  }

}
