# Cookbook Name:: vim
# Recipe:: default

include_recipe "git"

git "/home/#{node[:vimrc][:user]}/vimrc" do
  repository "#{node[:vimrc][:repository]}"
  revision "#{node[:vimrc][:revision]}"
  user "#{node[:vimrc][:user]}"
  action :sync
end

bash "update vimrc submodules" do
  cwd "/home/#{node[:vimrc][:user]}/vimrc"
  user "#{node[:vimrc][:user]}"
  code <<-EOH
    git submodule init && \
    git submodule update
  EOH
end

link "/home/#{node[:vimrc][:user]}/.vimrc" do
  owner "#{node[:vimrc][:user]}"
  group "#{node[:vimrc][:user]}"
  to "/home/#{node[:vimrc][:user]}/vimrc/vimrc"
end

link "/home/#{node[:vimrc][:user]}/.vim" do
  owner "#{node[:vimrc][:user]}"
  group "#{node[:vimrc][:user]}"
  to "/home/#{node[:vimrc][:user]}/vimrc/vim"
end

file "/home/#{node[:vimrc][:user]}/.vim/user.vim" do
  owner "#{node[:vimrc][:user]}"
  group "#{node[:vimrc][:user]}"
  action :touch
end
