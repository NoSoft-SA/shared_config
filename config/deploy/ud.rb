# VM instance at Unifrutti Dunbrody
server '172.17.0.243', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/shared_config'
# set :chruby_ruby, 'ruby-2.5.5'
