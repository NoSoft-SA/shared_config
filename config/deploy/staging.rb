# frozen_string_literal: true

# NoSoft Staging
server '196.44.33.187:6622', user: 'nosoft', roles: %w[app db web], web: { port: 6622 }
set :deploy_to, '/home/nosoft/shared_config'
