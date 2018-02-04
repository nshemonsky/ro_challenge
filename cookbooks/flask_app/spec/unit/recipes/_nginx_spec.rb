#
# Cookbook Name:: flask_app
# Spec:: default
#
# Copyright:: 2018, Jornaya, All Rights Reserved.

require 'spec_helper'

describe 'flask_app::_nginx' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end
end
