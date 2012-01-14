#
# Cookbook Name:: main
# Recipe:: default
#

# main
package "nautilus-dropbox"

#package "skype"

package "gimp"

package "dconf-tools"
package "nautilus-open-terminal"

package "tofrodos"
package "dos2unix"

package "gedit"

package "elinks"

# ubuntu scrollbars
package "overlay-scrollbar" do
  action :purge
end

package "liboverlay-scrollbar-0.2-0" do
  action :purge
end

