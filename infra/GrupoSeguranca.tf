resource "aws_security_group" "ssh_cluster" {
  name        = "ssh_cluster"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "ssh_cluster_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  security_group_id = aws_security_group.ssh_cluster.id
}

resource "aws_security_group_rule" "sssh_cluster_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  security_group_id = aws_security_group.ssh_cluster.id
}

resource "aws_security_group" "privado" {
  name        = "privado_ECS"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "entrada_ECS" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]  # ou self = true, se for comunicação interna
  security_group_id = aws_security_group.privado.id
}



resource "aws_security_group_rule" "saida_ECS" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  security_group_id = aws_security_group.privado.id
}