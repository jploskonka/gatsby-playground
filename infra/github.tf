provider "github" {
  token = var.github_token
}

resource "github_repository" "gatsby_playground" {
  name        = "gatsby-playground"
  description = "A playground for GatsbyJS"

  visibility = "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false
  is_template  = false

  pages {
    build_type = "workflow"

    source {
      branch = "main"
      path   = "/"
    }
  }
}

resource "github_actions_secret" "discord_webhook_id" {
  repository       = github_repository.gatsby_playground.name
  secret_name      = "discord_webhook_id"
  plaintext_value  = discord_webhook.for_github_actions.id
}

resource "github_actions_secret" "discord_webhook_token" {
  repository       = github_repository.gatsby_playground.name
  secret_name      = "discord_webhook_token"
  plaintext_value  = discord_webhook.for_github_actions.token
}

output "repo_html_url" {
  value = github_repository.gatsby_playground.html_url
}

output "repo_ssh_url" {
  value = github_repository.gatsby_playground.ssh_clone_url
}

output "pages_url" {
  value = github_repository.gatsby_playground.pages[0].html_url
}
