#
# Cookbook Name:: observium
# Recipe:: default
#
# Copyright (C) 2013 Roger Seagle
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# Installed required packages
%w{snmp graphviz subversion rrdtool fping imagemagick whois mtr-tiny nmap ipmitool}.each do |pkg|
  package pkg do
    action :install
  end
end

# Make sure directories are present
directory node[:observium][:install_dir] do
  owner "root"
  mode "0755"
  action :create
  recursive true 
end

# Checkout Observium source code
subversion "Observium Source" do
  repository node[:observium][:scm_source]
  revision "HEAD"
  destination "#{node[:observium][:install_dir]}/observium"
#FIXME:  notifies??
end

# Configure Observium's config.php
template "config.php" do
  path "#{node[:observium][:install_dir]}/observium/config.php"
  source "config.php.erb"
  owner "root"
  group "root"
  mode "0660"
#  notifies :restart, "service[ircd-hybrid]", :immediately
end

