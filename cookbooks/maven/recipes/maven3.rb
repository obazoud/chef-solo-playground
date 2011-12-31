#
# Cookbook Name:: maven
# Recipe:: maven3-bin
#
# Copyright 2011, Bryan W. Berry (<bryan.berry@gmail.com>)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "java"

remote_file "/tmp/apache-maven.tar.gz" do
  source node['maven']['m3_download_url']
  checksum node['maven']['m3_checksum']
end

directory node['maven']['m2_home']

bash "install_maven3" do
  folder_name = node['maven']['m3_download_url'].split('/')[-1].split('-bin.tar.gz')[0]
  puts folder_name
  cwd "/tmp"
  user "root"
  code <<-EOH
    tar xvzf apache-maven.tar.gz
    cp -r #{folder_name}/* #{node['maven']['m2_home']}
    rm -rf apache-maven.tar.gz #{folder_name}
  EOH
end

template "/etc/mavenrc" do
  source "mavenrc.erb"
  mode "0755"
end

link "/usr/bin/mvn" do
  to "#{node['maven']['m2_home']}bin/mvn" 
end
