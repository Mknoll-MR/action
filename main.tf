locals {
  counter = 3
}

resource "random_id" "this" {
  count       = local.counter
  byte_length = 8
}

resource "null_resource" "echo" {
  count = local.counter
  provisioner "local-exec" {
    command = "echo ${element(random_id.this.*.hex, count.index)}"
  }
}