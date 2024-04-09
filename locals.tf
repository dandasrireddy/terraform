locals {
  sg = {

    private_sg = aws_security_group.s_private_traffic.id

    public_sg = aws_security_group.s_public_traffic.id
  }


}
