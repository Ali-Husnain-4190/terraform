resource "aws_security_group" "ssh" {
  name        = var.security_group
  description = "this securoty group use for port 22"
  #vpc_id      = aws_vpc.main.id  ## if you do not define VPC it will create SG in default VPC
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "port 22"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    name = var.security_group
  }
}
resource "aws_security_group" "web" {
  name        = var.web_security_group
  description = "this securoty group use for port 80"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "port 80"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    name = var.web_security_group
  }
}
