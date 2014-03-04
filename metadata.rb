name             'nodejs_cookbook'
maintainer       'Jon Perritt'
maintainer_email 'jon.perritt@rackspace.com'
license          'All rights reserved'
description      'Installs/Configures a nodejs app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

#recipe "nodejs_app"

%w{apt application yum build-essential sudo git firewall nodejs ssh_known_hosts}.each do |cookbook|
  depends cookbook
end
