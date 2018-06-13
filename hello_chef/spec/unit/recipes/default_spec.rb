#
# Cookbook Name:: hello_chef
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'hello_chef::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe) do
	      runner.resource_collection.insert(
	                Chef::Resource::Service.new('nginx', runner.run_context))
  	  end
    end

    it 'it calls other recipe' do
      expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('openssl::upgrade')
      expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('nginx')
      expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('python')
      chef_run
    end

    it 'creates the template default.conf' do
	  expect(chef_run).to create_template('/etc/nginx/conf.d/default.conf')
	end

	it 'installs app' do
      execute = chef_run.execute("git pull")
    end
    
  end
end
