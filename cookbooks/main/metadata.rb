maintainer       "Olivier Bazoud"
maintainer_email "olivier.bazoud@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures stuff"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
depends          "apt"
%w( ubuntu ).each do |os|
  supports os
end

