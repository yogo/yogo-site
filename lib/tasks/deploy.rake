desc "Deploy the source code to optimus"
task :deploy  do
  puts "Beginning SCP... this could take an eternity."
  `scp -r output/* web_user@optimus.msu.montana.edu://var/www/yogo-test`
  puts "An eternity has passed, if you're still alive there may be a website up to look at."
end