server 'www.rcer.top', user: 'deploy', roles: %w{web app db}, primary: true

set :stage, :production
set :branch, :master
set :rails_env, :production
set :deploy_to, "/var/www/rc"
set :unicorn_worker_count, 5
set :rvm_type, :system
set :rvm_ruby_version , '2.2.3'
