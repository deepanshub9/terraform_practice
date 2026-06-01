terraform {
  required_version = ">= 1.1.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }
  }



backend "s3" {
        bucket = "deepanshu-tf-test-bucket"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform-demo-state-table"


}
}
