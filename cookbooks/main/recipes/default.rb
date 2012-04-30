#
# Cookbook Name:: main
# Recipe:: default
#

# main
package "libssl-dev"

package "nautilus-dropbox"
#package "skype"
package "gimp"

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

# ubuntu scrollbars
package "overlay-scrollbar" do
  action :purge
end

package "liboverlay-scrollbar-0.2-0" do
  action :purge
end

