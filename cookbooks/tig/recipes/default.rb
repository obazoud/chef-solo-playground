#
# Author:: Olivier Bazoud (olivier.bazoud@gmail.com)
# Cookbook Name:: tig
# Recipe:: default
#

include_recipe "build-essential"

package "ncurses-dev"

git "/usr/local/src/tig" do
    repository "#{node[:tig][:repository]}"
    revision "#{node[:tig][:revision]}"
    user "root"
    action :sync
    not_if "test -d /usr/local/src/tig"
end

bash "install tig from source" do
  cwd "/usr/local/src/tig"
  user "root"
  code <<-EOH
    make configure
    ./configure --prefix=#{node[:tig][:dir]} && \
    make && \
    make install
  EOH
end

