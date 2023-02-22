variable "ssh_auth_enabled" {
  description = <<EOF
    "If set to true, creates SSH authentication key
    in given Github account"
    EOF
  type        = bool
}

variable "public_ssh_key_name" {
  description = "Name of the SSH key file used for authentication"
  type        = string
  default     = null
}

variable "github_user_ssh_key_file" {
  description = "Path to the file containg public SSH key"
  default     = null
}