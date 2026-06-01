resource "local_file" "devops" {
	filename = "/home/ubuntu/terraform-days/terraform-variable/devops_test.txt"
	content = var.content_map["content1"]
}



resource "local_file" "devops-var" {
	filename = var.filename
	content = var.content_map["content2"]
}

output "devops_op_trainer" {
value = var.devops_op_trainer
}
