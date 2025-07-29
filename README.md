# Terraform Practice Repository

This repository contains my learning journey with Terraform, focusing on Infrastructure as Code (IaC) concepts and practical implementations.

## What I'm Learning

This repository demonstrates my progress in learning Terraform through hands-on examples covering:

- **Local File Management**: Creating and managing local files using Terraform
- **Variables and Data Types**: Working with different variable types including maps and strings
- **Docker Integration**: Managing Docker containers and images with Terraform
- **Resource Dependencies**: Understanding how Terraform manages resource relationships
- **Output Values**: Extracting and displaying information from Terraform resources

## Repository Structure

```
terraform_practice/
├── terraform-local/          # Basic local file operations
│   ├── local.tf              # Local file and random string resources
│   └── devops_automated.txt  # Generated output file
├── terraform-variable/       # Variable usage examples
│   ├── main.tf              # Main configuration with variable usage
│   ├── variables.tf         # Variable definitions
│   ├── devops_test.txt      # Static content file
│   └── devops-automated.txt # Variable-generated content
└── terraform-dev/           # Docker provider integration
    └── main.tf              # Docker container deployment
```

## Projects Overview

### 1. Terraform Local (`terraform-local/`)
**Learning Focus**: Basic Terraform resources and random string generation

- Creates local files with predefined content
- Generates random strings with special characters
- Demonstrates output values usage
- **Key Resources**: `local_file`, `random_string`

### 2. Terraform Variables (`terraform-variable/`)
**Learning Focus**: Variable types, maps, and dynamic content

- Implements different variable types (string, map)
- Uses map variables for content management
- Demonstrates variable defaults and references
- **Key Concepts**: Variable definitions, map data types, content templating

### 3. Terraform Dev (`terraform-dev/`)
**Learning Focus**: Provider configuration and container management

- Configures Docker provider
- Manages Docker images and containers
- Sets up port mappings for web services
- **Key Resources**: `docker_image`, `docker_container`
- **Real-world Application**: Deploys Nginx web server

## Technologies Used

- **Terraform**: Infrastructure as Code tool
- **HCL**: HashiCorp Configuration Language
- **Docker**: Containerization platform
- **Providers Used**:
  - `hashicorp/local` - Local file operations
  - `hashicorp/random` - Random value generation
  - `kreuzwerker/docker` - Docker resource management

## Learning Outcomes

Through this practice repository, I've gained hands-on experience with:

1. **Terraform Basics**
   - Resource definitions and configuration
   - Provider management and versioning
   - State management concepts

2. **Variable Management**
   - Default values and variable types
   - Map variables for structured data
   - Variable referencing in resources

3. **Docker Integration**
   - Container lifecycle management
   - Image pulling and management
   - Network configuration (port mapping)

4. **Best Practices**
   - Provider version constraints
   - Resource naming conventions
   - Output value usage

## Next Steps in My Learning Journey

- Explore Terraform modules for code reusability
- Learn about remote state management
- Practice with cloud providers (AWS, Azure, GCP)
- Implement Terraform workspaces
- Study advanced variable techniques and validation

## Getting Started

To run these examples:

1. **Prerequisites**: Install Terraform and Docker
2. **Navigate** to any project directory
3. **Initialize**: `terraform init`
4. **Plan**: `terraform plan`
5. **Apply**: `terraform apply`
6. **Cleanup**: `terraform destroy`

## Notes

This repository represents my ongoing learning process with Terraform. Each directory contains practical examples that build upon previous concepts, helping me understand Infrastructure as Code principles and Terraform's capabilities.

---

*This is a learning repository created as part of my DevOps journey to master Infrastructure as Code with Terraform.*
