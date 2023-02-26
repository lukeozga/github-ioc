output "ssh_key" {
  value = {
    "id"  = module.github_user_ssh_key.ssh_key[*].id
    "url" = module.github_user_ssh_key.ssh_key[*].url
  }
}