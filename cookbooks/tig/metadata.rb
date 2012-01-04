maintainer       "Olivier Bazoud"
maintainer_email "olivier.bazoud@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures tig"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"
recipe           "tig", "Installs Tig from source"

depends          "build-essential"
