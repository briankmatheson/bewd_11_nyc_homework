# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
MovieApp::Application.config.secret_key_base = 'dbf42ccda29b41eb4f82faac6561b2b43a700aa3a3be19ced017b7d79d1258b79d235390af8ec3d50ca9763ed3aa169be1ab5ca8341926a65e53ea0bcd4c0fac'
