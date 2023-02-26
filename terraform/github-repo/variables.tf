variable "github_token" {
  description = <<EOF
    "Github token required for provider authentication.
    If not set, GITHUB_TOKEN environment variable 
    can also be provided to avoid commiting secret."
    EOF
}

variable "standard_github_repositories" {
  description = "Map of objects describing managed non-template Github repositories."
  type = set(object({
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

variable "has_issues" {
  description = "Set to true to enable the GitHub Issues features on the repository."
  type        = bool
  default     = false
}

variable "has_discussions" {
  description = "Set to true to enable GitHub Discussions on the repository."
  type        = bool
  default     = false
}

variable "has_projects" {
  description = <<EOF
  "Set to true to enable the GitHub Projects features on the 
  repository. Per the GitHub documentation when in an
  organization that has disabled repository projects it will
  default to false and will otherwise default to true. 
  If you specify true when it has been disabled it will 
  return an error."
  EOF
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Set to true to enable the GitHub Wiki features on the repository."
  type        = bool
  default     = false
}

variable "is_template" {
  description = "Set to true to tell GitHub that this is a template repository."
  type        = bool
  default     = false
}

variable "allow_merge_commit" {
  description = "Set to false to disable merge commits on the repository."
  type        = bool
  default     = true
}

variable "allow_squash_merge" {
  description = "Set to false to disable squash merges on the repository."
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "Set to false to disable rebase merges on the repository."
  type        = bool
  default     = true
}

variable "allow_auto_merge" {
  description = "Set to true to allow auto-merging pull requests on the repository."
  type        = bool
  default     = false
}

variable "squash_merge_commit_title" {
  description = "Can be PR_TITLE or COMMIT_OR_PR_TITLE for a default squash merge commit title."
  type        = string
  default     = "COMMIT_OR_PR_TITLE"
}

variable "squash_merge_commit_message" {
  description = "Can be PR_BODY, COMMIT_MESSAGES, or BLANK for a default squash merge commit message."
  type        = string
  default     = "COMMIT_MESSAGES"
}

variable "merge_commit_title" {
  description = "Can be PR_TITLE or MERGE_MESSAGE for a default merge commit title."
  type        = string
  default     = "PR_TITLE"
}

variable "merge_commit_message" {
  description = "Can be PR_BODY, PR_TITLE, or BLANK for a default merge commit message."
  type        = string
  default     = "BLANK"
}

variable "delete_branch_on_merge" {
  description = "Automatically delete head branch after a pull request is merged."
  type        = bool
  default     = true
}

variable "auto_init" {
  description = "Set to true to produce an initial commit in the repository."
  type        = bool
  default     = true
}

variable "archived" {
  description = <<EOF
  "Specifies if the repository should be archived. Defaults to false.
  NOTE Currently, the API does not support unarchiving."
  EOF
  type        = bool
  default     = false
}

variable "archive_on_destroy" {
  description = "Set to true to archive the repository instead of deleting on destroy."
  type        = bool
  default     = false
}

variable "default_branch_name" {
  description = <<EOF
  "Name of the default branch created to initialize repository. Github's auto init
  creates master branch by default"
  EOF
  type        = string
  default     = "master"
}

