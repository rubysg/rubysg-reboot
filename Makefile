# A bunch of methods to work with fly.io

# These are the fly.io application name
web-app-name = rubysg-reboot
worker-app-name = rubysg-reboot-worker
database-app-name = rubysg-reboot-db

deploy-app:
	##################################################
	## Deploying Web Application
	##################################################
	flyctl deploy --app $(web-app-name) --remote-only -c fly.toml

deploy-worker:
	##################################################
	## Deploying Job Worker
	##################################################
	flyctl deploy --app $(worker-app-name) --remote-only -c fly.worker.toml

deploy:
	##################################################
	## Deploying
	##################################################
	deploy-app
	deploy-worker

show-app-resources:
	##################################################
	## Fetching CPU and RAM allocation for App machine
	##################################################
	fly scale show --app $(web-app-name)

show-worker-resources:
	##################################################
	## Fetching CPU and RAM allocation for Worker
	## machine
	##################################################
	fly scale show --app $(web-worker-name)

connect-to-database:
	##################################################
	## Connecting to production postgres db
	## \list to see all databases
	## \c to choose database
	## \dt to list all tables
	##################################################
	flyctl postgres connect --app $(database-app-name)

connect-to-app-machine:
	##################################################
	## Connect to the machine hosting the web app in
	## /app directory
	##################################################
	fly ssh console --app $(web-app-name)

connect-to-worker-machine:
	##################################################
	## Connect to the machine hosting the worker app
	## in /app directory
	##################################################
	fly ssh console --app $(worker-app-name)

connect-to-app-console:
	##################################################
	## Connect to the rails console for web app
	##################################################
	fly ssh console --app $(web-app-name) --pty -C "/app/bin/rails console"

connect-to-worker-console:
	##################################################
	## Connect to the rails console for worker
	##################################################
	fly ssh console --app $(worker-app-name) --pty -C "/app/bin/rails console"
