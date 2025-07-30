resource "aws_s3_bucket" "my_s3_bucket" {
 bucket = "deepanshu-tf-test-bucket"
 tags = {
 Name = "deepanshut-train-bucket"
 Environment = "Dev"

}
}


resource "aws_dynamodb_table" "my_dynamo_table" {
        name = "terraform-demo-state-table"
        billing_mode = "PAY_PER_REQUEST"
        hash_key = "LockID"
        attribute {
        name = "LockID"
        type = "S"
        }
}