# ruby Cookbook CHANGELOG
This file is used to list changes made in each version of the ruby cookbook.

## v1.0.0 (2016-02-08)
- Marking this cookbook as officially deprecated.  See the readme for additional information
- Added support for RHEL 7 and new Fedora package naming schemas
- Expanded Test Kitchen testing platforms and added serverspec tests
- Added Travis CI testing and integration testing with Kitchen Docker
- Added Rubocop config and resolved all issues
- Resolved foodcritic warnings and added a .foodcritic file to disable the definition warning
- Updated contributing and testing documentation
- Add maintainers.md file
- Added a Rakefile for simplified testing
- Added a chefignore file to reduce the number of files uploaded to the chef server
- Added suse to the metadata.rb
- Added issues_url and source_url to the metadata.rb
- Added a simple chefspec to ensure the compile phase completes

## v0.9.3
The "Don't Be Hasty" release.
- Remove `ruby-mode` package (fixes several issues)
- Add `name` to metadata (also fixes several issues)
- Create test kitchen harness
- CHEF is now the maintainer
- Create `cookbook_version` attribute to specify the version originating from the cookbook. **This is an internally used attribute primarily, and may change in the future, or be removed**.

## v0.9.2
- "Initial" public release.
- First entry in the CHANGELOG.md, because we have to start somewhere.
