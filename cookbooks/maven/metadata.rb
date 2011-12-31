maintainer       "Bryan W. Berry"
maintainer_email "bryan.berry@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures maven"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.2"

%w{ java }.each do |cb|
  depends cb
end

%w{ debian ubuntu centos redhat fedora }.each do |os|
  supports os
end

