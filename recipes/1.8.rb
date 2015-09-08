#
# Cookbook Name:: ruby
# Recipe:: 1.8
#
# Copyright 2010, FindsYou Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
log 'ruby-1.8-unsupported' do
  message <<-EOH
Ruby 1.8 is EOL and unsupported upstream.
Consider upgrading to a current, supported version.
https://www.ruby-lang.org/en/news/2013/06/30/we-retire-1-8-7/
EOH
  level :warn
end

ruby_packages '1.8'
