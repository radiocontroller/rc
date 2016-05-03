# Load the Rails application.
require File.expand_path('../application', __FILE__)

# append env variables
app_env_vars = File.join('/var/www/rc/shared/config', 'app_env_vars.rb')
load(app_env_vars) if File.exists?(app_env_vars)

# Initialize the Rails application.
Rails.application.initialize!
