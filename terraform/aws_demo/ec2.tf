resource "aws_instance" "web" {
  count         = 3
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t3.micro"
  associate_public_ip_address = true
  subnet_id = "subnet-06ae0df47f1cd3b23"

  key_name = "micah-test"

  vpc_security_group_ids = ["sg-02dd235fb28d1d9f7"]

  tags = {
    Name = "Ansible-Terraform-Test"
    Owner = "micah.martin@harness.io"
  }
}


output "host" {
  value = "${jsonencode(aws_instance.web[*].public_ip)}"
}
