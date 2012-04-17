#
# Cookbook Name:: git
# Attributes:: source
#

default['git']['source']['version']        = "1.7.10"
default['git']['source']['prefix']         = "/usr/local"
default['git']['source']['url']            = "http://git-core.googlecode.com/files/git-#{node['git']['source']['version']}.tar.gz"
default['git']['source']['checksum']       = "501ee8685c148d377950e42c111e01d83fd1d41a"

