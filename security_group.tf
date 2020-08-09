resource "aws_security_group" "puppet_sg" {
  name        = "puppet"
  description = "puppet security group"
  vpc_id      = var.vpc
  tags = {
    Name = "Puppet_security_group"
  }
}