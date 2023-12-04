# authorized via GITHUB_TOKEN env var 
provider "github" { }

resource "github_repository" "gatsby-playground" {
  name = "gatsby-playground"
  description = "A playground for GatsbyJS"

  visibility = "private"

  has_issues = true
  has_projects = false
  has_wiki = false
  is_template = false
}