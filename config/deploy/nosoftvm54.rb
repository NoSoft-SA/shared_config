# VM instance at NoSoft offices
# set :chruby_ruby, 'ruby-2.5.5'
server '192.168.50.54', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/shared_config'
