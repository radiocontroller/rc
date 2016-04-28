server '115.29.43.142', user: 'deploy', roles: %w(web app db), primary: true

set :stage, :production
set :branch, 'master'
set :rails_env, :production
set :deploy_to, "/var/www/rc"
set :unicorn_worker_count, 5
