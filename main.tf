provider "aws" {
  region = "us-east-1" # Change as needed
}

resource "aws_instance" "jenkins_server" {
  ami                    = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI, update as needed
  instance_type          = "t2.micro"
  key_name               = "your-key" # Replace with your key pair
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  user_data              = file("install_jenkins.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
