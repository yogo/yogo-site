# Yogo Data Management Framework Website #

These are the web files for yogo.msu.montana.edu.  

# Developer Information #

This site is built with webby/haml and deployed with capistrano.  Install the bundle gem and run `bundle install` to get the relevant gems.

## Building the site files ##

From the root of the repository, run `webby` to compile the site to the "output" directory. 

## Viewing/Updating the site files ##

The links in the site are absolute and intended to be viewed relative to the root of a webserver. As a result, development should be done running `webby autobuild` in the root of the repository.  This  tracks file changes and automatically builds site files.  It also runs a webserver on port 4331 that serves the web files.

## Some Notes ##

* Updating partials does not trigger an autobuild.
* Keep all images in the /images dir, nested in subdirs for organization
* Two space tabs please

# Deploying the code #

Deploy the *output files* to the server using `cap deploy`.  People with permission to update the webserver will have their ssh key added to the webserver's ssh keys. You should not have to modify the deployment file ever.

*NOTE:* _Your current output files will be deployed_, it does not perform a clean build from your content code or the code pushed to github.  Make sure your output site files represent what you want to deploy.  When in doubt, delete the output directory and rebuild, or, do a `webby clobber && webby build` (which does just that). 