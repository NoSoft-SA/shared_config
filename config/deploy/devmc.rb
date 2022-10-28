# DEV Mouton Citrus NSPack
server '192.168.200.3', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/shared_config'
# set :chruby_ruby, 'ruby-2.5.8'
