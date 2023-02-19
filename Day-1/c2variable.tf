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


variable "security_group" {
  description = "Name of security group"
  type        = string
  default     = "my sg"
}
variable "web_security_group" {
  description = "web web_security_group"
  type        = string
  default     = "my web"

}
variable "instance_type" {
  description = " instance type which you want"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  default = "my_instance"
}
