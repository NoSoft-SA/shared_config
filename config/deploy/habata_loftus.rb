# VM instance at NoSoft offices
set :chruby_ruby, 'ruby-2.5.5'
server '192.168.0.50', user: 'habata', roles: %w[app db web]
set :deploy_to, '/home/habata/shared_config'
