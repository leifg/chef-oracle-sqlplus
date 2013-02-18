maintainer       'Leif Gensert'
maintainer_email 'leif@propertybase.com'
license          'MIT'
description      'installs Oracle client on Ubuntu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

%w{ubuntu debian}.each do |os|
  supports os
end
