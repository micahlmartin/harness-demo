variable "foo" {
  type = string
  description = "Some var"
}

output "foo" {
  value = var.foo
}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'YO asdfasdfs !!!!!'"
  }
}

# resource "null_resource" "exampl2" {
#   provisioner "local-exec" {
#       command = "echo 'estingasdfasdf asdfasdafsfd'"
#   }
# }

resource "local_file" "foo" {
  content     = var.foo
  filename = "${path.module}/foo.bar"
  file_permission = "0755"
}

resource "null_resource" "example3" {
  provisioner "local-exec" {
      command = "echo 'estingasdfaasdf asdf af ssdf asdfasdafsfd'"
  }
}



