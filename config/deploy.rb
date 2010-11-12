# Uncomment these if you want to try using cap's native copy
# set :repository,  "./output"
# set :scm, :none
# set :deploy_via, :copy
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

namespace :webby do
  desc "Rebuild the site files"
  task :rebuild do
    'webby:clobber'
    'webby:build'
  end

  task :clobber do
    system 'webby clobber'
  end
  
  desc "Build the site files"
  task :build do
    system 'webby'
  end
end
before "deploy", "webby:rebuild"

desc "Set production or development"
task :set_environment do
  set :srv_env, Capistrano::CLI.ui.ask("Deploy to [*1]development or [2]production: ")
  case srv_env
  when "1" then set :deploy_to, "/var/www/yogo-dev"
  when "2" then set :deploy_to, "/var/www/yogo.msu.montana.edu"
  else 
    set :deploy_to, "/var/www/yogo-dev"
  end
  puts "Deploying output/ to #{deploy_to}."
end
before "deploy", "set_environment"
