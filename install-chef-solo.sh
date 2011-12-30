#!/bin/sh
set -x

wget -qO- https://raw.github.com/obazoud/linux-bootstrap/master/update-ubuntu.sh | sh

# http://wiki.opscode.com/display/chef/Installing+Chef+Client+on+Ubuntu+or+Debian

# pre installation
echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list
sudo mkdir -p /etc/apt/trusted.gpg.d
gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null
sudo aptitude --assume-yes --quiet update
sudo aptitude --assume-yes --quiet install opscode-keyring
sudo aptitude --assume-yes --quiet safe-upgrade

# install
echo "chef chef/chef_server_url string none" | sudo debconf-set-selections
sudo aptitude --assume-yes --quiet install chef

# Ruby
sudo aptitude --assume-yes --quiet install ruby ruby-dev libopenssl-ruby rdoc ri irb build-essential wget ssl-cert curl

# RubyGems
cd /tmp
curl -O http://production.cf.rubygems.org/rubygems/rubygems-1.8.12.tgz
tar zxf rubygems-1.8.12.tgz
cd rubygems-1.8.12
sudo ruby setup.rb --no-format-executable
rm -rf /tmp/rubygems-1.8.12
rm -f /tmp/rubygems-1.8.12.tgz

# Gem mysql
sudo aptitude --assume-yes --quiet install mysql-client libmysql-ruby libmysqlclient-dev
sudo gem install mysql



