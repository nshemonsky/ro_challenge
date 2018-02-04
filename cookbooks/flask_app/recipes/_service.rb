# Cookbook Name:: flask_app
# Recipe:: _service

# No time to troubleshoot service failures with auto-generated service
# definition from poise-service. Dropping our own config.

cookbook_file '/etc/init/demo_flask_app.conf' do
  source 'demo_flask_app.conf'
  owner 'root'
  group 'root'
  mode 0o0644
  notifies :restart, 'service[demo_flask_app]', :immediately
end

service 'demo_flask_app' do
  provider Chef::Provider::Service::Upstart
  action :nothing
end
