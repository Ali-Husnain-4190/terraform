# variable
how to declare variable in terraform
```
variable "aws_region" {
  description = "default of region is virginia "
  type        = string

  default = "us-east-1"
}
```