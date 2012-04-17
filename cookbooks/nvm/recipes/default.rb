# Cookbook Name:: nvm
# Recipe:: default

include_recipe "git"
include_recipe "zsh"

git clone git://github.com/creationix/nvm.git ~/nvm

git "/home/#{node[:nvm][:user]}/nvm" do
    repository "#{node[:nvm][:repository]}"
    revision "#{node[:nvm][:revision]}"
    user "#{node[:nvm][:user]}"
    group "#{node[:nvm][:user]}"
    action :sync
    not_if "test -d /home/#{node[:nvm][:user]}/nvm"
end

link "/home/#{node[:nvm][:user]}/.zshrc" do
  owner "#{node[:nvm][:user]}"
  group "#{node[:nvm][:user]}"
  to "/home/#{node[:nvm][:user]}/.oh-my-zsh/zshrc"
  only_if "test -f /home/#{node[:nvm][:user]}/.oh-my-zsh/zshrc"
end

