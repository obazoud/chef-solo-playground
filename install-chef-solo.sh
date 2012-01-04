#!/bin/sh
set -x

# updating Ubuntu
sudo apt-get --assume-yes install aptitude
sudo aptitude --assume-yes --quiet update
sudo aptitude --assume-yes --quiet safe-upgrade
sudo aptitude --assume-yes --quiet install python-software-properties

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
RUBY_GEMS_VERSION="1.8.12"
cd /tmp
curl -O http://production.cf.rubygems.org/rubygems/rubygems-${RUBY_GEMS_VERSION}.tgz
tar zxf rubygems-${RUBY_GEMS_VERSION}.tgz
cd rubygems-${RUBY_GEMS_VERSION}
sudo ruby setup.rb --no-format-executable
rm -rf /tmp/rubygems-${RUBY_GEMS_VERSION}
rm -f /tmp/rubygems-${RUBY_GEMS_VERSION}.tgz

