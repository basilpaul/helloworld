#
# Cookbook Name:: hello_chef
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'openssl::upgrade'

include_recipe 'nginx'

include_recipe 'python'


execute 'create user' do
  command "useradd #{node['hello']['user']}"
  not_if { Dir.exists?("/home/#{node['hello']['user']}") }
end

#Create meteor group
group "#{node['hello']['group']}" do
end

#Install git if not present, dependency of npm
package 'git'

#Install dependencies
python_pip "flask"
python_pip "healthcheck"
python_pip "six"

template '/etc/nginx/conf.d/default.conf' do
  source 'default.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :reload, "service[nginx]", :delayed
end

execute "git pull" do
  cwd "/opt/helloworld"
  command "git pull"
  only_if { ::Dir.exist?("/opt/helloworld") }
end

execute "install application" do
  cwd "/opt"
  command "git clone #{node['hello']['app']}"
  not_if { ::Dir.exist?("/opt/helloworld") }
end

#Create service file for applications
systemd_unit 'hello.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=hello app
  [Service]
  Type=simple
  User=#{node['hello']['user']}
  Group=#{node['hello']['group']}
  ExecStart=/usr/bin/python /opt/helloworld/app/hello.py
  [Install]
  WantedBy=multi-user.target
  EOU

  action [:create, :enable]
  notifies :restart, 'service[hello]', :delayed
end

#Start hello service
service 'hello' do
  action [ :enable, :start ]
end