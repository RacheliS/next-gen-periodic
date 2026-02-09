resource "aws_security_group" "allow_ssh_all" {
  name        = "allow_ssh"
  description = "Allow SSH from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # ISSUE: CIDR block allows the whole internet
    cidr_blocks = ["0.0.0.0/0"]
  }
}
