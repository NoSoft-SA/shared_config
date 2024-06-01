# Swellenfruit
# server '192.168.10.5', user: 'nspack', roles: %w[app db web]
server '192.168.11.2', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/shared_config'
