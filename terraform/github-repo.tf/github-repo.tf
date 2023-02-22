locals {
  github_pages_repos = var.github_pages_repositories
  python_repos       = var.python_repositories
  terraform_repos    = var.terraform_repositories
  javascript_repos   = var.javascript_repositories
  all_repositories = merge(
    var.github_pages_repos,
    var.python_repos,
    var.terraform_repos,
    var.javascript_repos,
  )
}

resource "github_repository" "repo" {
  for_each = local.all_repositories

  name        = each.name
  description = each.description
  visibility  = each.visibility
}
