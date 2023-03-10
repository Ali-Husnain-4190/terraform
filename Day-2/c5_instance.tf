resource "aws_instance" "web" {
  ami = data.aws_ami.my_ami.id
  #instance_type          = var.instance_type
  #instance_type          = var.instance_type_list[0]
  instance_type          = var.instance_type_map["dev"]
  key_name               = "bash-test"
  vpc_security_group_ids = [aws_security_group.ssh.id, aws_security_group.web.id]

  tags = {
    Name = var.instance_name
  }
}
