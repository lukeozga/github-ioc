module "github_user_ssh_key" {
  source = "./user-ssh-key"

  ssh_auth_enabled         = var.ssh_auth_enabled
  public_ssh_key_name      = var.public_ssh_key_name
  public_ssh_key_file_path = var.public_ssh_key_file_path
}

module "github_repositories" {
  source = "./github-repo"

  standard_github_repositories = var.standard_github_repositories
}