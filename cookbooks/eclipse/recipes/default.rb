#
# Cookbook Name:: eclipse
# Recipe:: default
#

include_recipe "java"

package "tar"

directory "#{node['eclipse']['dir']}" do
  owner "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  action :create
end

remote_file "#{node['eclipse']['dir']}/eclipse-#{node['eclipse']['version']}.tar.gz" do
  source "#{node['eclipse']['url']}"
  mode "0644"
  checksum "#{node['eclipse']['checksum']}"
  owner "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  not_if {File.exists?("#{node['eclipse']['dir']}/eclipse-#{node['eclipse']['version']}.tar.gz")}
end

execute "tar xzf #{node['eclipse']['dir']}/eclipse-#{node['eclipse']['version']}.tar.gz -C #{node['eclipse']['dir']} --owner #{node[:oh_my_zsh][:user]}" do
  user "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  not_if {File.directory?("#{node['eclipse']['dir']}/eclipse-#{node['eclipse']['version']}/")}
end

execute "mv #{node['eclipse']['dir']}/eclipse #{node['eclipse']['dir']}/eclipse-#{node['eclipse']['version']}" do
  user "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  not_if {File.directory?("#{node['eclipse']['dir']}/eclipse-#{node['eclipse']['version']}")}
end

link "#{node['eclipse']['dir']}/default" do
  owner "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  to "#{node['eclipse']['dir']}/eclipse-#{node['eclipse']['version']}"
end

link "/usr/bin/eclipse" do
  owner "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  to "#{node['eclipse']['dir']}/default/eclipse"
end

directory "/home/#{node[:oh_my_zsh][:user]}/.eclipse" do
  owner "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  action :create
end

template "/home/#{node[:oh_my_zsh][:user]}/.eclipse/eclipserc" do
  source "eclipserc.erb"
  owner "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  mode "0755"
end

template "#{node['eclipse']['dir']}/eclipse-#{node['eclipse']['version']}/eclipse.ini" do
  source "eclipse.ini.erb"
  owner "#{node[:oh_my_zsh][:user]}"
  group "#{node[:oh_my_zsh][:user]}"
  mode "0755"
end

# fix: http://askubuntu.com/questions/66356/gdk-gtk-warnings-and-errors-from-the-command-line
package "gtk2-engines-pixbuf"

#directory "#{node['eclipse']['dir']}/dropins" do
#  owner "#{node[:oh_my_zsh][:user]}"
#  group "#{node[:oh_my_zsh][:user]}"
#  action :create
#end

#"#{node['eclipse']['plugins']}".each do |plugin|
#  remote_file "#{node['eclipse']['dir']}/dropins/#{node['eclipse']['plugin'][plugin]['file']}" do
#    source "#{node['eclipse']['plugin'][plugin]['url']}"
#    mode "0644"
#    checksum "#{node['eclipse']['plugin'][plugin]['checksum']}"
#    owner "#{node[:oh_my_zsh][:user]}"
#    group "#{node[:oh_my_zsh][:user]}"
#    not_if {File.exists?("#{node['eclipse']['dir']}/dropins/#{node['eclipse']['plugin'][plugin]['file']}")}
#  end
#end


