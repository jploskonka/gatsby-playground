terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }

    discord = {
      source  = "Lucky3028/discord"
      version = "~> 1.5"
    }
  }

  required_version = "~> 1.5"
}
