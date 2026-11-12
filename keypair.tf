resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_keypair" {
  key_name   = "ddhb-key"
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "local_file" "pem_file" {
  content         = tls_private_key.my_key.private_key_pem
  filename        = "${path.module}/ddhb-key.pem"
  file_permission = "0400"
}