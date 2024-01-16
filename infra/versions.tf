terraform {
  required_version = "~> 1.6"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.44"
    }

    discord = {
      source  = "Lucky3028/discord"
      version = "~> 1.6"
    }
  }
}
