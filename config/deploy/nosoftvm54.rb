# VM instance at NoSoft offices
server '192.168.50.54', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/shared_config'
