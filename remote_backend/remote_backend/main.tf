provider "aws" {
        region = "us-east-1"
}


resource "aws_instance" "aws_ec2_test" {
count = 1
 ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_AWS_Remote_backend"
  }
}

output "instance_pub_ip" {
                value = aws_instance.aws_ec2_test[*].public_ip
 }