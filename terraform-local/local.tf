resource "local_file" "devops" {
	filename = "/home/ubuntu/terraform-days/terraform-local/devops_automated.txt"
	content = "I want to become a good DevOps Engineer Who know how to create things in Terraform"

}


resource "random_string" "rand-str" {
length = 15
special = true
override_special = "!#$%&*()-=[]{}<>:?"
}

output "rand-str" {
value = random_string.rand-str[*].result
}

