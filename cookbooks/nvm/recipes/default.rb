# Cookbook Name:: nvm
# Recipe:: default

include_recipe "git"
include_recipe "zsh"

git "/home/#{node[:nvm][:user]}/nvm" do
    repository "#{node[:nvm][:repository]}"
    revision "#{node[:nvm][:revision]}"
    user "#{node[:nvm][:user]}"
    group "#{node[:nvm][:user]}"
    action :sync
    not_if "test -d /home/#{node[:nvm][:user]}/nvm"
end

