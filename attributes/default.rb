#
# Author: Joshua Timberman <joshua@chef.io>
# Copyright (c) 2014, Chef Software, Inc <legal@chef.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['ruby']['cookbook_version'] = case node['platform_family']
                                      when 'debian'         then '1.9.1'
                                      when 'gentoo'         then '1.9'
                                      when 'smartos'        then '193'
                                      when 'rhel', 'fedora' then 'unused'
                                      else
                                        node['languages']['ruby']['version']
                                      end
