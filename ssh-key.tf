resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "${var.prefix}-ec2-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "ssh_pem" {
  count    = var.enable_ssh_key ? 1 : 0
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/${var.prefix}-ec2-key.pem"
  file_permission = "0400"
}
