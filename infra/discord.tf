provider "discord" {
  token = var.discord_token
}

resource "discord_server" "gatsby_playground" {
  name   = "Gatsby Playground"
  region = "eu-central"
}

resource "discord_text_channel" "github_actions" {
  name                     = "github-actions"
  sync_perms_with_category = false
  server_id                = discord_server.gatsby_playground.id
}

resource "discord_webhook" "for_github_actions" {
  name       = "Deployment bot"
  channel_id = discord_text_channel.github_actions.id
}

# resource "discord_invite" "invite_me" {
#   channel_id = discord_text_channel.github_actions.id
# }
#
# output "discord_invite_id" {
#   value = discord_invite.invite_me.id
# }
