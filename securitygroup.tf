


resource "aws_security_group" "s_public_traffic" {
  name        = "allow_http_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.svpc.id

  dynamic "ingress" {
    for_each = var.inbound_rule

    content {
      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  /*
  ingress {
    description = "Http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


  }
*/

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }


  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "s_private_traffic" {
  name        = "allow_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.svpc.id


  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
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
    Name = "allow_ssh"
  }
}