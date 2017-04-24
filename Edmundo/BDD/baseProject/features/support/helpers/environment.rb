require "base64"

def get_token
  Base64.encode64("#{$app_user}:#{$app_pass}")
end
