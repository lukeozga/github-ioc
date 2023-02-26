variable "github_token" {
  description = <<EOF
    "Github token required for provider authentication.
    If not set, GITHUB_TOKEN environment variable 
    can also be provided to avoid commiting secret."
    EOF
}

variable "ssh_auth_enabled" {
  description = <<EOF
    "If set to true, creates SSH authentication key
    in given Github account."
    EOF
  type        = bool
}

variable "public_ssh_key_name" {
  description = "Name of the SSH key file used for authentication."
  type        = string
  default     = "Github SSH public key"
}

variable "public_ssh_key_file_path" {
  description = "Path to the file containg public SSH key."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}