data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count         = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  associate_public_ip_address = true
  subnet_id = "subnet-06ae0df47f1cd3b23"

  key_name = "micah-test"

  vpc_security_group_ids = ["sg-0d70669a5383c4216"]

  tags = {
    Name = "Ansible-Terraform-Test"
    Owner = "micah.martin@harness.io"
  }
}


output "host" {
  value = "${jsonencode(aws_instance.web[*].public_ip)}"
}
