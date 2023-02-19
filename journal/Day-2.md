#List
we can define list this way. we will use in Ec2 instance

```
variable "instance_type_list" {
  description = "Ec2 instance type"
  type        = list(string)
  default     = ["t2.micro", "t3.micro"]
}

resource "aws_instance" "web" {
    ...
  #instance_type          = var.instance_type_list[0]
    ...
}
```
# Map 
Map is a way when you want to use 
```
variable "instance_type_map" {
  description = "Ec2 instance type with map"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "prod" = "t3.micro"
  }
}

resource "aws_instance" "web" {
    ...
  instance_type          = var.instance_type_map["dev"]
    ...
}
```

