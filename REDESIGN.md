# Redesign Proposal

## Out of Scope

- this IS NOT an rvm cookbook
- this IS NOT an rbenv cookbook
- this IS NOT a chruby cookbook

## Problem

Existing ruby cookbooks all try to do too many things and fail to deliver useful use cases to
either library cookbooks or users.

They rely on overriding attributes and source-vs-binary package installs and try to do too much.

Mostly cookbooks want to have a sane way of saying 'i want a ruby in the path' or 'i need at least
ruby 2.1 installed somewhere'.  These use cases can be dealt with using recipes, but should not
be attribute driven.

Users want the ability to install either from packages easily or to build a given exact version of
ruby and install it someone custom -- maybe wiring up to /usr/local or not.  These use cases should
be entirely resource-driven.

## Requirements

### Resource Driven Cookbook With No Attributes

Any new 2.0 version of this cookbook MUST be attribute-free and MUST be implemented using 12.x style
new resources.  The implementation of the cookbook SHOULD be designed so that it MAY be included into
chef-client core at some later date.

There will be no 'source'-vs-'package' attribute, no way to override attributes, etc.

### Package Installs

Package installs will generally install the latest version of ruby on the operating system.  This will
mostly be offered as a default installation method for community cookbooks which only wish to declare that they
want "A" version of ruby installed and do not care.  As some of the operating systems that we support
install ruby 1.8.5 and other old rubies by default use of package installs is asserting that either those
distros are unsupported, or that the cookbook is back-compat to the oldest ruby on the oldest operating
system that it supports.

This also may be acceptable for individual users who are only concerned with one distro version who
want to install that ruby and use it.

There is an issue with more recent Ubuntu versions where there are multiple different versions of ruby
in packages.  The proposed solution for this is to install the highest supported version of ruby on
the distro (PPAs and external repos are out of scope).  Package installs will NOT support installing
from different locations or installing different ruby package versions.

### Source Installs

Source installs should be handled by a resource.  The implementation should likely use the ruby-install gem.
It should be possible to fully customize the installation location of the ruby.

### "I NEED RUBY"

There needs to be a way for a cookbook to depend on the ruby cookbook such that ANY installed ruby via ANY
method is fine with it.  There is no control over the version, and typically this will default to a package
install.  If the user has installed ruby via source for some other version, and wired that version up to 
the PATH, then that will satisfy this requirement and no package installation or source installation will
occur.

### "I NEED RUBY X.Y.Z"

Cookbooks that want to specify a version of ruby MUST use the source-installing resource.  If a cookbook wants
a ruby >= 2.1, and wants it to be portable, it MUST use the source installation method.

### Recipes

The default recipe MUST be equivalent to the "I NEED RUBY" use case.  This use case asserts "i do not care, I just
need ruby in my PATH".

Any source install which wires up its ruby to the PATH will also satisfy this use case.

This recipe MUST not be tweakable by attributes.

If a ruby has been installed via packages or installed via source and wired up to the PATH, this recipe is a NOP

### Ruby Version Recipes

These recipe are satisfied if the appropriate ruby version has been source installed into the server.  We need
a library method to query so that the cookbook can determine where the ruby version it wants has been installed.

There needs to be a default location to install the ruby, and it MUST not wire these ruby versions up to /usr/local.

These recipes MUST not be tweakable by attributes, they feed state to each other via state held in libraries.

## Implementation Details

### ruby-install and Omnibus Chef

The source installs MUST use ruby-install rather than rolling its own use case.  The cookbook MUST assume omnibus-chef
and a recent enough ruby that ruby-install works.  Porting the cookbook to gem installs on RHEL5 is explicitly
out of scope.

### Library helpers

This cookbook will need to track how it is invoked.

When cookbooks declare that they want 'A' ruby in the PATH that needs to be satisfied by later declarations to
either package install ruby or to source install ruby and wire it up to /usr/local.

When cookbooks declare that they want 'A' ruby-2.1 then that needs to be satisfied by later declarations to
install ruby 2.1 somewhere.

Cookbooks need an API to determine where the user installed ruby-2.1

This design REPLACES attributes with state held in PORO in library files that is driven by resources.

### Symlinks

Resources should take an argument to wire up symlinks to a user specified directory (e.g. `/usr/local`)

### S3 upload/download

Building ruby from source takes a long time, there should be a way to build it once on a server, upload to an S3
bucket and then download from the bucket (see https://github.com/lamont-granquist/sk_ruby)

