# frozen_string_literal: true

# GHS - Goede Hoop Sitrus
# OLD NSLD: server '192.168.6.21', user: 'ghsadmin', roles: %w[app db web]
server '192.168.6.31', user: 'nsprint', roles: %w[app db web]
# OLD NSLD: set :deploy_to, '/home/ghsadmin/shared_config'
set :deploy_to, '/home/nsprint/shared_config'
# set :chruby_ruby, 'ruby-2.5.8'
