module "github_user_ssh_key" {
  source = "./user-ssh-key"

  ssh_auth_enabled         = var.ssh_auth_enabled
  public_ssh_key_name      = var.public_ssh_key_name
  github_user_ssh_key_file = var.github_user_ssh_key_file
}