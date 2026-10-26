terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9"
    }
  }
}

resource "random_uuid" "imported" {

}

import {
  to = random_uuid.imported
  id = "11223344-5566-7788-99aa-bbccddeeff00"
}

output "imported_uuid" {
  value = random_uuid.imported.result
}