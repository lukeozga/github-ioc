resource "github_user_ssh_key" "public_ssh_key" {
  count = var.ssh_auth_enabled ? 1 : 0
  title = var.public_ssh_key_name
  key   = var.public_ssh_key_file != null ? file(var.public_ssh_key_file) : file("~/.ssh/id_rsa.pub")
}