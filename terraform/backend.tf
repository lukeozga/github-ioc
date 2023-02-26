terraform {
  backend "local" {
    path = var.terraform_state_file_path != "../terraform.tfstate" ? var.terraform_state_file_path : "../terraform.tfstate"
  }
}