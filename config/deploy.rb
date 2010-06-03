# set :application,   "voeis-demo"
# set :repository,    "https://caJaeger@github.com/yogo/yogo-site.git"
# set :apps_database, "#{application}_production"
# set :dev_database,  "#{application}_development"

desc "Common Settings"
task :common_settings do
  set :deploy_to, "//var/www/yogo-test"
  set :user,      "web_user"
  set :use_sudo,  false

  server domain, :app, :web
end

# desc "Deploy to dev.msu.montana.edu"
# task :dev do
#   set :user, "web_user"
#   set :domain, "optimus.msu.montana.edu"
#   common_settings
# end

namespace :deploy do 
  run "scp ../output web_user@optimus.msu.montana.edu://var/www/yogo-test"
  common_settings
end