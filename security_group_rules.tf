
resource "aws_security_group_rule" "puppet_ingress_0" {
  type              = "ingress"
  from_port         = 8140
  to_port           = 8140
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.puppet_sg.id
  description       = "Self"
}

resource "aws_security_group_rule" "puppet_ingress_1" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["86.41.57.99/32"]
  security_group_id = aws_security_group.puppet_sg.id
  description       = "SSH access"
}

resource "aws_security_group_rule" "puppet_ingress_2" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["86.41.57.99/32"]
  security_group_id = aws_security_group.puppet_sg.id
  description       = "RDP access"
}

resource "aws_security_group_rule" "puppet_egress_1" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.puppet_sg.id
  description       = "Allow all out"
}
