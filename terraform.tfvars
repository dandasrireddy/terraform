ami_id        = "ami-080e1f13689e07408"
instance_type = "t2.micro"

subnets = {
  public_subnet = {
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1a"
  },
  private_subnet = {
    cidr_block              = "10.0.2.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1e"
  }

}

inbound_rule = {
  allow_http_traffic = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  allow_ssh_traffic = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  allow_https_traffic = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

vm = {

  public_vm = {
    ami                         = "ami-080e1f13689e07408"
    instance_type               = "t2.micro"
    key_name                    = "sridhrakey"
    availability_zone           = "us-east-1a"
    vpc_security_group_ids      = "public_sg" #aws_security_group.s_public_traffic.*.id
    subnet_id                   = "public_subnet" #aws_subnet.subnet.*.id
    associate_public_ip_address = true
  }
  private_vm = {
    ami                         = "ami-080e1f13689e07408"
    instance_type               = "t2.micro"
    key_name                    = "sridhrakey"
    availability_zone           = "us-east-1e"
    vpc_security_group_ids      = "private_sg" #aws_security_group.s_private_traffic.*.id
    subnet_id                   = "private_subnet" #aws_subnet.sunet.*.id
    associate_public_ip_address = true
  }
}
