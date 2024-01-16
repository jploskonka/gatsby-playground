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

output "repo_html_url" {
  value = github_repository.gatsby_playground.html_url
}

output "repo_ssh_url" {
  value = github_repository.gatsby_playground.ssh_clone_url
}
