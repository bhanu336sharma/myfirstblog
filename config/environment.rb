# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
App1::Application.initialize!
  config.action_mailer.default_url_options = { host: 'bhanublog.herokuapp.com', port: 3000 }


require 'carrierwave/orm/activerecord'
