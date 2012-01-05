#
# Cookbook Name:: git
# Recipe:: source
#

include_recipe "build-essential"

package "zlib1g-dev"

remote_file "/usr/local/src/git-#{node['git']['source']['version']}.tar.gz" do
  source "#{node['git']['source']['url']}"
  mode "0644"
  checksum "#{node['git']['source']['checksum']}"
  owner "root"
  group "root"
  not_if {File.exists?("/usr/local/src/git-#{node['git']['source']['version']}.tar.gz")}
end

bash "install git from source" do
  cwd "/usr/local/src"
  user "root"
  code <<-EOH
    tar zxf git-#{node['git']['source']['version']}.tar.gz && \
    cd git-#{node['git']['source']['version']} && \
    make configure && \
    ./configure --prefix=#{node['git']['source']['prefix']} && \
    make man install install-doc
  EOH
end

