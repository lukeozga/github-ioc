output "ssh_key" {
  value = {
    "id"  = github_user_ssh_key.public_ssh_key[*].id
    "url" = github_user_ssh_key.public_ssh_key[*].url
  }
}