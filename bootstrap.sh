#!/bin/sh
set -x

git clone https://github.com/obazoud/chef-solo-playground && cd chef-solo-playground
sudo chef-solo -c /tmp/chef-solo-playground/solo.rb -j /tmp/chef-solo-playground/node.json
# cookbook
# -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
rm -rf /tmp/chef-solo-playground



