#
# Cookbook Name:: idea
# Recipe:: default
#

include_recipe "java"

package "tar"

directory "#{node['idea']['dir']}" do
  owner "#{node[:idea][:user]}"
  group "#{node[:idea][:user]}"
  action :create
end

remote_file "#{node['idea']['dir']}/idea-#{node['idea']['version']}.tar.gz" do
  source "#{node['idea']['url']}"
  mode "0644"
  checksum "#{node['idea']['checksum']}"
  owner "#{node[:idea][:user]}"
  group "#{node[:idea][:user]}"
  not_if {File.exists?("#{node['idea']['dir']}/idea-#{node['idea']['version']}.tar.gz")}
end

execute "tar xzf #{node['idea']['dir']}/idea-#{node['idea']['version']}.tar.gz -C #{node['idea']['dir']} --owner #{node[:idea][:user]}" do
  user "#{node[:idea][:user]}"
  group "#{node[:idea][:user]}"
  not_if {File.directory?("#{node['idea']['dir']}/idea-#{node['idea']['version']}/")}
end

