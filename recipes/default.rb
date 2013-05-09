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
%w{libapache2-mod-php5 php5-cli php5-mysql php5-gd php5-snmp php-pear snmp graphviz subversion mysql-server mysql-client rrdtool fping imagemagick whois mtr-tiny nmap ipmitool}.each do |pkg|
  package pkg do
    action :install
  end
end

# Make sure directories are present
directory node[:observium][:log_dir] do
  owner "root"
  mode "0755"
  action :create
  recursive true 
end
