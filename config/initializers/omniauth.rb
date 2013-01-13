require 'forcedotcom'

# Set the default hostname for omniauth to send callbacks to.
# seems to be a bug in omniauth that it drops the httpS
# this still exists in 0.2.0
OmniAuth.config.full_host = 'https://localhost:3000'
# OmniAuth.config.full_host = 'https://telesales-rails.heroku.com'

module OmniAuth
  module Strategies
    #tell omniauth to load our strategy
    autoload :Forcedotcom, 'lib/forcedotcom'
  end
end

# created a new remote access for heroku
Rails.application.config.middleware.use OmniAuth::Builder do
  # Telesales App - Heroku
  # provider :forcedotcom, '3MVG9VmVOCGHKYBSMFoH607T0CtHEK8.Hytco3Z.oY45u4n8Pkk81aJMqBvPih1aPnnUMU82mXpHL_mYriYAh', '4084422413897598678'
  # Telesales Rails - Local
  provider :forcedotcom, '3MVG9VmVOCGHKYBSMFoH607T0CnBOhjc53A0HyP3Ow9gYjwWVFvv4VOeueERzhsl3mQKziprCe.Fc14mA2iwp', '5246129761561248443'
end