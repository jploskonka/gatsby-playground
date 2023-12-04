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
  repository      = github_repository.gatsby_playground.name
  secret_name     = "DISCORD_WEBHOOK_ID"
  plaintext_value = discord_webhook.for_github_actions.id
}

resource "github_actions_secret" "discord_webhook_token" {
  repository      = github_repository.gatsby_playground.name
  secret_name     = "DISCORD_WEBHOOK_TOKEN"
  plaintext_value = discord_webhook.for_github_actions.token
}

output "pages_url" {
  value = github_repository.gatsby_playground.pages[0].html_url
}
