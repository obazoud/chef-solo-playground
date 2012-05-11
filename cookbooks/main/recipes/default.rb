#
# Cookbook Name:: main
# Recipe:: default
#

# main
package "libssl-dev"

package "nautilus-dropbox"
#package "skype"
package "gimp"
package "screen"
package "gedit"
package "dconf-tools"
package "nautilus-open-terminal"
package "tofrodos"
package "dos2unix"
package "elinks"
package "wget"
package "curl"
package "tree"
package "gconf-editor"
package "ubuntu-restricted-extras"
package "gparted"
package "filezilla"
package "colordiff"

include_recipe "apt"

apt_repository "sublime-text-2" do
  uri "http://ppa.launchpad.net/webupd8team/sublime-text-2/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  action :add
end
package "sublime-text-2-dev"

# ubuntu scrollbars
package "overlay-scrollbar" do
  action :purge
end

package "liboverlay-scrollbar-0.2-0" do
  action :purge
end

