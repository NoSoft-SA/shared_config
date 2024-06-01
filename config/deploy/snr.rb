# VM instance at Sun River
server '192.168.19.9', user: 'nosoftadmin', roles: %w[app db web]
set :deploy_to, '/home/nosoftadmin/shared_config'
