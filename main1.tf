provider "aws" {
  region = "us-east-1"  # Change as needed
}

resource "aws_instance" "my_instances" {
  count         = 2  # Launch 2 EC2 instances
  ami           = "ami-04b4f1a9cf54c11d0"  # Replace with latest Amazon Linux 2 AMI
  instance_type = "t3.micro"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345"  # Change to a globally unique name
}
