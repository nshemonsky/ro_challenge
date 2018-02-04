name             'flask_app'
maintainer       'Nick Shemonsky'
maintainer_email 'n.shemonsky@gmail.com'
license          'all_rights'
description      'Installs/Configures flask_app'
version          '0.1.0'
chef_version     '> 0.0.0'

%w[application_git application_python nginx
   poise-build-essential poise-python].each { |cb| depends cb }

%w[amazon centos oracle redhat].each { |os| supports os }

url = 'https://gitlab.com/leadid-ops'
issues_url "#{url}/flask_app/issues" if respond_to?(:issues_url)
source_url "#{url}/flask_app" if respond_to?(:source_url)
