# Cookbook Name:: flask_app
# Recipe:: default

recipes = %w[::_nginx ::_deploy_app ::_service]

recipes.each do |r|
  include_recipe r
end
