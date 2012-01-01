# Author:: Olivier Bazoud (<olivier.bazoud@gmail.com>)
# Apache 2.0 license
# Cookbook Name:: eclipse
# Attributes:: default

# General settings
default['eclipse']['dir']       = "/opt/eclipse"
default['eclipse']['version']   = "3.7.1"
default['eclipse']['user']      = 'user'
default['eclipse']['url']       = "http://ftp.heanet.ie/pub/eclipse//technology/epp/downloads/release/indigo/SR1/eclipse-java-indigo-SR1-linux-gtk-x86_64.tar.gz"
default['eclipse']['checksum']  = "6bac43e274dbc3cf2ecb8fa6e53ca6847846a5b5"

# Plugins settings
#default['eclipse']['plugins'] = []
#
#default['eclipse']['plugin']['easyshell']['file']       = "easyshell"
#default['eclipse']['plugin']['easyshell']['url']        = "http://ignum.dl.sourceforge.net/project/pluginbox/easyshell/Release-1.3.5/Easy_Shell_1.3.5.zip"
#default['eclipse']['plugin']['easyshell']['checksum']   = "6bac43e274dbc3cf2ecb8fa6e53ca6847846a5b5"

