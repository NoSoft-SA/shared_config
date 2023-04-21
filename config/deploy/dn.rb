# VM instance at Denau
server '192.168.10.5', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/shared_config'
