/*
resource "aws_instance" "myinstance_sridhar" {
  #ami           = "ami-080e1f13689e07408"
  ami = var.ami_id
  instance_type = var.instance_type

  tags = {
    "Name" = "My Ec2 Instance Sridhar"
    "regioin" = "us-east-1"
  }
}
*/

resource "aws_instance" "myec2" {

    for_each = var.vm

   ami                         = each.value.ami
  instance_type               = each.value.instance_type
  key_name                    = each.value.key_name
  availability_zone           = each.value.availability_zone
  vpc_security_group_ids      = [lookup(local.sg, each.value.vpc_security_group_ids)]
  subnet_id                   = aws_subnet.subnet[each.value.subnet_id].id
  associate_public_ip_address = each.value.associate_public_ip_address

 user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Sridahr's public VM</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = each.key
    Owner = "sridhar"
  }
}
  
/*
resource "aws_instance" "public_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "sridhrakey"
  availability_zone           = "us-east-1a"
  vpc_security_group_ids      = [aws_security_group.s_public_traffic.id]
  subnet_id                   = aws_subnet.s_public_subnet.id
  associate_public_ip_address = true
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Sridahr's public VM</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "web1_instance"
  }


}


  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "sridhrakey"
  availability_zone      = "us-east-1e"
  vpc_security_group_ids = [aws_security_group.s_private_traffic.id]
  subnet_id              = aws_subnet.s_private_subnet.id
  user_data              = <<-EOF
        #!/bin/bash
         #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "web2_instance"
  }


}
*/

