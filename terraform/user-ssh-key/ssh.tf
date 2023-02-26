resource "github_user_ssh_key" "public_ssh_key" {
  count = var.ssh_auth_enabled ? 1 : 0
  title = var.public_ssh_key_name
  key   = file(var.public_ssh_key_file_path)
}