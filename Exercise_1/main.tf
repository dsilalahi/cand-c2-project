# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
	region = "us-east-2"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "ec2_t2" {
	ami = "ami-05d72852800cbf29e"
	instance_type = "t2.micro"
	count = 4

	# UDARR-Application
	vpc_security_group_ids = ["sg-0d81dd2de3dc665c0"]
	subnet_id = "subnet-00e94bda4300d7d7d"

	tags = {
		Name = "Udacity T2"
	}
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "ec2_m4" {
	ami = "ami-05d72852800cbf29e"
	instance_type = "m4.large"
	count = 2

	# UDARR-Database
	vpc_security_group_ids = ["sg-02e242ecd5003461f"]
	subnet_id = "subnet-0f1aa8fc590cc125a"

	tags = {
		Name = "Udacity M4"
	}
}