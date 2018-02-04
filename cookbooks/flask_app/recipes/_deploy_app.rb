#
# Cookbook Name:: flask_app
# Recipe:: _deploy_app
#
# Copyright:: 2018, Jornaya, All Rights Reserved.

include_recipe 'poise-python'

directory '/opt/demo_flask_app' do
  owner 'ec2-user'
end

# Utilize community resource to deploy python app
application '/opt/demo_flask_app' do
  git 'https://github.com/nshemonsky/demo_flask_app.git'
  pip_requirements
  gunicorn do
    bind 'unix:/opt/demo_flask_app/app.sock'
    user 'ec2-user'
  end
end
