# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#TypeTwitter::Application.config.secret_key_base = 'b8e55e68386364e8d2472b780f9ed3011a1f2d31440ebf9135330fb7e4a074b745ad48de9214740b0f801bdf5826082cff609e545e74036e68523ae2e19f9bbc'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

TypeTwitter::Application.config.secret_key_base = secure_token