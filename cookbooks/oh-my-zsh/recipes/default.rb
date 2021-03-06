# Cookbook Name:: oh-my-zsh
# Recipe:: default

include_recipe "git"
include_recipe "zsh"

git "/home/#{node[:oh_my_zsh][:user]}/.oh-my-zsh" do
    repository "#{node[:oh_my_zsh][:repository]}"
    revision "#{node[:oh_my_zsh][:revision]}"
    user "#{node[:oh_my_zsh][:user]}"
    group "#{node[:oh_my_zsh][:user]}"
    action :sync
    not_if "test -d /home/#{node[:oh_my_zsh][:user]}/.oh-my-zsh"
end

link "/home/#{node[:oh_my_zsh][:user]}/.zshrc" do
  owner "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  to "/home/#{node[:oh_my_zsh][:user]}/.oh-my-zsh/zshrc"
  only_if "test -f /home/#{node[:oh_my_zsh][:user]}/.oh-my-zsh/zshrc"
end

