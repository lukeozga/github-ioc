module "github_user_ssh_key" {
  source = "./user-ssh-key"

  github_token             = var.github_token
  ssh_auth_enabled         = var.ssh_auth_enabled
  public_ssh_key_name      = var.public_ssh_key_name
  public_ssh_key_file_path = var.public_ssh_key_file_path
}

module "github_repositories" {
  source = "./github-repo"

  github_token                 = var.github_token
  default_branch_name          = var.default_branch_name
  standard_github_repositories = var.standard_github_repositories
}