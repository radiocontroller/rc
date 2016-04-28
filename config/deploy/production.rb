role :app, %w{root@115.29.43.142}
role :web, %w{root@115.29.43.142}
role :db,  %w{root@115.29.43.142}

set :branch, 'production'

set :deploy_to, "/var/www/rc"

set :rvm_ruby_version, '2.2.3'

# dont try and infer something as important as environment from
# stage name.
set :rails_env, "production"

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 5
