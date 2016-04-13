name              'ruby'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache 2.0'
description       'Installs Ruby and related packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

recipe 'ruby', 'Installs Ruby and related packages'
recipe '1.8', 'Installs Ruby 1.8 and related packages'
recipe '1.9', 'Installs Ruby 1.9 and related packages'
recipe '1.9.1', 'Installs Ruby 1.9.1 and related packages'
recipe 'symlinks', 'Installs symlinks for the default Ruby version'

%w( amazon arch centos debian fedora gentoo oracle redhat scientific suse ubuntu zlinux ).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/ruby' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/ruby/issues' if respond_to?(:issues_url)
