# Patrysberg
# server '192.168.15.5', user: 'nspack', roles: %w[app db web]
server '10.147.17.114', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/shared_config'
