#
# Cookbook Name:: git
# Attributes:: source
#

default['git']['source']['version']        = "1.7.8.2"
default['git']['source']['prefix']         = "/usr/local"
default['git']['source']['url']            = "http://git-core.googlecode.com/files/git-#{node['git']['source']['version']}.tar.gz"
default['git']['source']['checksum']       = "7187c1af96db0c181b801957d6e152ec7cd60ab6"

