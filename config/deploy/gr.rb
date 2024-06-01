# Golden Ridge
server '192.168.30.1', user: 'nosoft', roles: %w[app db web]
set :deploy_to, '/home/nosoft/shared_config'
