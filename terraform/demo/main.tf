variable "foo" {
  type = string
  description = "Some var"
}
output "foo" {
  value = foo
}