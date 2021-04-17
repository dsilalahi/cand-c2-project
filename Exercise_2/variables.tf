# TODO: Define the variable for aws_region
variable "aws_region" {
	type = string
  	default = "us-east-2"
}

variable "vpc_id" {
    type = string
    description = "VPC ID"
    default = "vpc-0fc07502ad9021fc1"
}