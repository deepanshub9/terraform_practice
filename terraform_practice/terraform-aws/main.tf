terraform {
  required_version = ">= 1.1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "aws_ec2_test" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_AWS"
  }
}

output "instance_pub_ip" {
                value = aws_instance.aws_ec2_test[*].public_ip
 }



resource "aws_s3_bucket" "b" {
 bucket = "deepanshu-tf-test-bucket"
 tags = {
 Name = "deepanshut-train-bucket"
 Environment = "Dev"

}
} 
