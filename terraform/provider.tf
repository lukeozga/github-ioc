terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  required_version = "~> 4.0"
}

provider "github" {
    token = var.github_token != null ? var.github_token : null
}