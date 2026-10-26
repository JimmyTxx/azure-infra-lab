terraform {
  required_version = ">= 1.7.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.9"
    }
  }
}

resource "local_file" "demo" {
  filename        = "${path.module}/managed.txt"
  content         = "Version 2 - changed intentionally with Terraform\n"
  file_permission = "0644"
}

output "managed_file_path" {
  value = local_file.demo.filename
}