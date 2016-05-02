# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'rc'
set :repo_url, 'git@github.com:radiocontroller/rc.git'
set :deploy_to, '/var/www/rc'
set :deploy_user, 'deploy'
set :scm, :git
set :format, :pretty
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/images}

# Default value for keep_releases is 5
set :keep_releases, 5

set :rvm_type, :system
set :rvm_ruby_string, '2.2.3'
set :rvm_roles, [:app, :web, :db]

namespace :deploy do
  desc 'symbolic link to images folder'
  task :link_to_images do
    on roles(:all) do
      execute :ln, "-nfs /var/www/rc_images #{release_path}/public/images"
    end
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'link_to_images'
end
