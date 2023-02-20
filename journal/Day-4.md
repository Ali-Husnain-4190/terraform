# Meta argumemt 
In this we are going to learn for_each meta argument.

# Data source
we use data source to get value from AWS directly using data.
like below code you are using to get AZ of region
```
data "aws_availability_zones" "example" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

How to use in our code resoucr 
```