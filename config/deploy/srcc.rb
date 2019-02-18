# VM instance at SRCC.
server '10.0.0.30', user: 'nsld', roles: %w[app db web]
set :deploy_to, '/home/nsld/shared_config'
set :ssh_options,
    forward_agent: true,
    keys: '~/.ssh/id_rsa'
set :chruby_ruby, 'ruby-2.5.1'
