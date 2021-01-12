data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnet" "selected" {
  count = length(split(",", var.subnet_ids))
  id = split(",", var.subnet_ids)[count.index]
}

resource "aws_security_group" "http" {
  name        = "${var.name}-http"
  description = "Allow inbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "port_80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "port_8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ingress"
  }
}
