# Cookbook Name:: flask_app
# Recipe:: _nginx

# Setting repo_source to nil prevents nginx cookbook from configuring
# any additional repos (EPEL). We'd like to get nginx from the default
# Amazon repo
node.default['nginx']['repo_source'] = nil

# Prevent nginx cookbook from enabling the default site, we'll build our own.
node.default['nginx']['default_site_enabled'] = false

# Disable displaying nginx ver
node.default['nginx']['server_tokens'] = 'off'

# Set nginx user for chef_nginx cookbook to create log dir with correct perms.
node.default['nginx']['user'] = 'ec2-user'

# Install and configure nginx via community cookbook
include_recipe 'nginx'

# Lay down our nginx site config
template '/etc/nginx/sites-available/demo_flask_app' do
  owner 'root'
  group 'root'
  mode 0o0644
  source "demo_flask_app.erb"
  notifies :reload, 'service[nginx]'
end

# Enable the nginx site
nginx_site 'demo_flask_app'
