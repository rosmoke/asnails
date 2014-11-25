require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "29fa16d5d372ee62a47062dc6b0834c13501dca619b95e665d608ed3bca4079f"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('app/assets/images/gallery', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
