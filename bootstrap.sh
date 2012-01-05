#!/bin/sh
set -x

cd /tmp

if [ $# -gt 0 ]; then
  wget https://nodeload.github.com/obazoud/chef-solo-playground/tarball/master -O chef-solo-playground.tar.gz
  tar xzf chef-solo-playground.tar.gz
  mv obazoud-chef-solo-playground* chef-solo-playground
  cd chef-solo-playground
  sudo chef-solo -c /tmp/chef-solo-playground/solo.rb -j /tmp/chef-solo-playground/node.json
else
  git clone git://github.com/obazoud/chef-solo-playground && cd chef-solo-playground
  sudo chef-solo -c /tmp/chef-solo-playground/solo.rb -j /tmp/chef-solo-playground/node.json
  # default chef-solo cookbook: -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
  rm -rf /tmp/chef-solo-playground
fi

