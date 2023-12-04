provider "discord" {
  token = var.discord_token
}

resource "discord_server" "gatsby_playground" {
  name   = "gatsby playground"
  region = "eu-central"
}

resource "discord_category_channel" "notifications" {
  name      = "notifications"
  server_id = discord_server.gatsby_playground.id
}

resource "discord_text_channel" "github_actions" {
  name      = "github-actions"
  server_id = discord_server.gatsby_playground.id
  category  = discord_category_channel.notifications.id
}

resource "discord_webhook" "for_github_actions" {
  name       = "For github actions"
  channel_id = discord_text_channel.github_actions.id
}

resource "discord_invite" "invite_me" {
  channel_id = discord_text_channel.github_actions.id
}

output "invite_id" {
  value = discord_invite.invite_me.id
}
