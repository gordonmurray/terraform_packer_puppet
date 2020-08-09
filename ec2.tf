# Get AMIs
data "aws_ami" "puppet_master_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["puppet_master"]
  }
  owners = [var.aws_account_id]
}

data "aws_ami" "puppet_linux_node_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["puppet_linux_node"]
  }
  owners = [var.aws_account_id]
}

data "aws_ami" "puppet_windows_node_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["puppet_windows_node"]
  }
  owners = [var.aws_account_id]
}

# Create EC2 instances
resource "aws_instance" "puppet_master" {
  ami                    = data.aws_ami.puppet_master_ami.id
  instance_type          = var.default_instance_type
  vpc_security_group_ids = [aws_security_group.puppet_sg.id]
  subnet_id              = var.subnet
  key_name               = var.pem_key
  iam_instance_profile   = var.profile
  tags = {
    Name = "puppet master"
  }
}

resource "aws_instance" "puppet_linux_node" {
  ami                    = data.aws_ami.puppet_linux_node_ami.id
  instance_type          = var.default_instance_type
  vpc_security_group_ids = [aws_security_group.puppet_sg.id]
  subnet_id              = var.subnet
  key_name               = var.pem_key
  iam_instance_profile   = var.profile
  tags = {
    Name = "puppet linux node"
  }
}

resource "aws_instance" "puppet_windows_node" {
  ami                    = data.aws_ami.puppet_windows_node_ami.id
  instance_type          = var.default_instance_type
  vpc_security_group_ids = [aws_security_group.puppet_sg.id]
  subnet_id              = var.subnet
  key_name               = var.pem_key
  iam_instance_profile   = var.profile
  tags = {
    Name = "puppet windows node"
  }
}