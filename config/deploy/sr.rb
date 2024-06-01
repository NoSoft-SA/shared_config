# VM instance at Sitrusrand
server '192.168.2.6', user: 'nspack', roles: %w[app db web]
# server '192.168.252.146', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/shared_config'
# set :chruby_ruby, 'ruby-2.5.8'
