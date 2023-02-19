terraform {
  backend "local" {
    path = var.terraform_state_file_path == null ? "./terraform.tfstate" : var.terraform_state_file_path
  }
}