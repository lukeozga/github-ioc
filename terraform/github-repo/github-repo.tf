locals {
  general_repository_settings = {
    has_issues                  = var.has_issues,
    has_discussions             = var.has_discussions,
    has_projects                = var.has_projects,
    has_wiki                    = var.has_wiki,
    is_template                 = var.is_template,
    allow_merge_commit          = var.allow_merge_commit,
    allow_squash_merge          = var.allow_squash_merge,
    allow_rebase_merge          = var.allow_rebase_merge,
    allow_auto_merge            = var.allow_auto_merge,
    squash_merge_commit_title   = var.squash_merge_commit_title,
    squash_merge_commit_message = var.squash_merge_commit_message,
    merge_commit_title          = var.merge_commit_title,
    merge_commit_message        = var.merge_commit_message,
    delete_branch_on_merge      = var.delete_branch_on_merge,
    has_downloads               = var.has_downloads,
    auto_init                   = var.auto_init,
    archived                    = var.archived,
    archive_on_destroy          = var.archive_on_destroy
  }
  github_repos     = { for repo in var.standard_github_repositories : repo.name => merge(repo, local.general_repository_settings) }
  pages_repos_list = [for repo in var.standard_github_repositories : repo.name if repo.pages != null]
}

resource "github_repository" "standard_repository" {
  for_each = local.github_repos

  name                        = each.value.name
  description                 = each.value.description
  visibility                  = each.value.visibility
  homepage_url                = each.value.homepage_url
  gitignore_template          = each.value.gitignore_template
  license_template            = each.value.license_template
  has_issues                  = each.value.has_issues
  has_discussions             = each.value.has_discussions
  has_projects                = each.value.has_projects
  has_wiki                    = each.value.has_wiki
  is_template                 = each.value.is_template
  allow_merge_commit          = each.value.allow_merge_commit
  allow_squash_merge          = each.value.allow_squash_merge
  allow_rebase_merge          = each.value.allow_rebase_merge
  allow_auto_merge            = each.value.allow_auto_merge
  squash_merge_commit_title   = each.value.squash_merge_commit_title
  squash_merge_commit_message = each.value.squash_merge_commit_message
  merge_commit_title          = each.value.merge_commit_title
  merge_commit_message        = each.value.merge_commit_message
  delete_branch_on_merge      = each.value.delete_branch_on_merge
  has_downloads               = each.value.has_downloads
  auto_init                   = each.value.auto_init
  archived                    = each.value.archived
  archive_on_destroy          = each.value.archive_on_destroy
  topics                      = each.value.topics

  dynamic "pages" {
    for_each = {
      for value in local.pages_repos_list : value => value if value == each.value.name
    }
    content {
      source {
        branch = each.value.pages.branch
        path   = each.value.pages.path
      }
    }
  }
}

resource "github_branch_default" "default" {
  for_each = github_repository.standard_repository

  repository = github_repository.standard_repository[each.key].name
  branch     = var.default_branch_name
  rename     = var.default_branch_name != "master" ? true : false

  depends_on = [
    github_repository.standard_repository
  ]
}