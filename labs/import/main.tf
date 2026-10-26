terraform {
  required_version = ">= 1.7.0, < 2.0.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9"
    }
  }
}

resource "random_uuid" "imported" {
}

output "imported_uuid" {
  value = random_uuid.imported.result
}