#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: java
# Recipe:: openjdk
#
# Copyright 2010-2011, Opscode, Inc.
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

version = node['java']['jdk_version']
java_home = node['java']['java_home']
# specific to Ubuntu
if version == "7"
  arch = node['kernel']['machine'] =~ /x86_64/ ? "x86_64" : "i386"
  java_link_name = "java-1.#{version}.0-openjdk-#{arch}"
else
  java_link_name = "java-1.#{version}.0-openjdk"
end


pkgs = value_for_platform(
                          ["centos","redhat","fedora"] => {
                            "default" => ["java-1.#{version}.0-openjdk","java-1.#{version}.0-openjdk-devel"]
                          },
                          "default" => ["openjdk-#{version}-jdk"]
                          )

if platform? "ubuntu", "debian"
  execute "update-java-alternatives" do
    command "update-java-alternatives -s #{java_link_name}"
    returns [0,2]
    action :nothing
  end
else
  execute "update-java-alternatives" do
    command "update-alternatives --install /usr/bin/java java #{java_home}/bin/java 1;
             update-alternatives --set java #{java_home}/bin/java"  
    returns [0,2]
    action :nothing
  end
end
  
pkgs.each do |pkg|
  package pkg do
    action :install
    notifies :run, "execute[update-java-alternatives]"
  end
end
