# Cookbook:: bcpc
# Recipe:: packages-openstack
#
# Copyright:: 2019 Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

return unless node['bcpc']['openstack']['repo']['enabled']

package 'ubuntu-cloud-keyring'

repo = node['bcpc']['openstack']['repo']
branch = repo['branch']
release = repo['release']
codename = node['lsb']['codename']
distribution = "#{codename}-#{branch}"
distribution = "#{codename}-#{branch}/#{release}" unless release.empty?

apt_repository 'openstack' do
  uri repo['url']
  distribution distribution
  components ['main']
  key repo['key']
end
