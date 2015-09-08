name              'ruby'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache 2.0'
description       'Installs Ruby and related packages'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.9.3'

recipe 'ruby', 'Installs Ruby and related packages'
recipe '1.8', 'Installs Ruby 1.8 and related packages'
recipe '1.9', 'Installs Ruby 1.9 and related packages'
recipe '1.9.1', 'Installs Ruby 1.9.1 and related packages'
recipe 'symlinks', 'Installs symlinks for the default Ruby version'

attribute 'languages/ruby/default_version',
 display_name: 'Default Ruby version',
 recipes: %w(ruby symlinks),
 choice: ['1.8', '1.9', '1.9.1'],
 default: '1.8',
 description: 'The Ruby version to install with the ruby recipe and create symlinks for with the symlinks recipe. Unfortunately this setting only works fully on Ubuntu, Debian and Gentoo.'

%w( amazon arch centos debian fedora gentoo oracle redhat scientific suse ubuntu ).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/ruby' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/ruby/issues' if respond_to?(:issues_url)
