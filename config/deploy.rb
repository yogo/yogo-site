# Uncomment these if you want to try using cap's native copy
# set :repository,  "./output"
# set :scm, :none
# set :deploy_via, :copy
set :deploy_to, "/var/www/yogo.msu.montana.edu"
set :user,      "web_user"
set :server_url, "optimus.msu.montana.edu"
set :use_sudo,  false

role :app, server_url

# Get rid of these overridden tasks if you want to use cap's native copy
namespace :deploy do
  desc 'Upload the site'
  task :update_code do
    Net::SCP.start(server_url, user, :port => 22) do |scp|
      scp.upload! 'output',  release_path, :recursive => true
    end
  end
  
  desc "Skipping restart task"
  task :restart do
    puts "  * Skipping the restart task!"
  end
end