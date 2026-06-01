variable "filename" {
	default = "/home/ubuntu/terraform-days/terraform-variable/devops-automated.txt"
}

variable "content" {
	default = "This is auto genrated from a variables"
}

variable "devops_op_trainer" {}

variable "content_map" {
type = map 
default = {
"content1" = "This is cool content 1!"
"content2" = "This is cooler content 2!" 

}
}
