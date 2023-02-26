# General configuration variables
variable "terraform_state_file_path" {
  description = "Path to terraform.tfstate"
  type        = string
  default     = null
}

variable "github_token" {
  description = <<EOF
    "Github token required for provider authentication.
    If not set, GITHUB_TOKEN environment variable 
    can also be provided to avoid commiting secret."
    EOF
}

# github_user_ssh_key module related variables
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
  default     = null
}

variable "public_ssh_key_file_path" {
  description = "Path to the file containg public SSH key."
  default     = null
}

# Repository variables
variable "standard_github_repositories" {
  description = "Map of objects describing managed non-template Github repositories."
  type = list(object({
    name               = string
    description        = string
    visibility         = string
    homepage_url       = string
    gitignore_template = string
    license_template   = string
    topics             = set(string)
    pages              = map(string)
  }))
}