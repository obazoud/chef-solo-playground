#
# Cookbook Name:: git
# Recipe:: source
#

include_recipe "build-essential"

case node[:platform]
when "debian", "ubuntu"
  bash "install git dependencies" do
    user "root"
    code <<-EOH
      apt-get build-dep git-core -y -q
    EOH
  end
else
  log "This platform is not yet supported."
end

remote_file "/usr/local/src/git-#{node['git']['source']['version']}.tar.gz" do
  source "#{node['git']['source']['url']}"
  mode "0644"
  checksum "#{node['git']['source']['checksum']}"
  owner "root"
  group "root"
  not_if {File.exists?("/usr/local/src/git-#{node['git']['source']['version']}.tar.gz")}
end

bash "untar git source" do
  cwd "/usr/local/src"
  user "root"
  code <<-EOH
    tar zxf git-#{node['git']['source']['version']}.tar.gz
  EOH
  not_if {File.directory?("/usr/local/src/git-#{node['git']['source']['version']}/")}
end

bash "install git from source" do
  cwd "/usr/local/src/git-#{node['git']['source']['version']}"
  user "root"
  code <<-EOH
    ./configure --prefix=#{node['git']['source']['prefix']} --with-curl --with-expat && \
    make && \
    make install
  EOH
end

