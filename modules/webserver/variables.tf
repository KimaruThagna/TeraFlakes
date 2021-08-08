variable "vpc_id" {
	type = string
}

variable "cidr_block" {
	type = string
    default = "10.0.0.0/16"
}

variable "name" {
	type = string
}

variable "ami" {
	type = string
}

variable "instance_type" {
	type    = string
	default = "t2.micro"
}