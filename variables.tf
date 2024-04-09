variable "ami_id" {

  type    = string
  default = "ami-0cd59ecaf368e5ccf"

}
variable "instance_type" {
  type = string
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}


variable "cidr_block_public_subnet_ip_range" {
  default = "10.0.1.0/24"
}

variable "cidr_block_private_subnet_ip_range" {
  default = "10.0.2.0/24"

}

variable "subnets" {
  type = any

}

variable "inbound_rule" {
  type = any

}

variable "vm" {
  type = any
}
