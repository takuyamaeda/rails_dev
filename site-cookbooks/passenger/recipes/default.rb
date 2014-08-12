#
# Cookbook Name:: passenger
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

["curl-devel", "httpd", "httpd-devel"].each do |name|
package "#{name}" do
  action :install
end
end

service "httpd" do
  action [:start, :enable]
end

gem_package "passenger" do
  gem_binary("/usr/local/rbenv/shims/gem")
  action :install
end

execute "rbenv rehash" do
  command "source /etc/profile.d/rbenv.sh;rbenv rehash"
  action :run
end

bash 'install_passenger' do
  user 'root'

  code <<-EOC
    export RBENV_ROOT="/usr/local/rbenv/"
    export PATH="${RBENV_ROOT}/bin:$PATH"
    eval "$(rbenv init -)"
    passenger-install-apache2-module --auto
    passenger-install-apache2-module --snippet > /etc/httpd/conf.d/passenger.conf
  EOC

  creates "/etc/httpd/conf.d/passenger.conf"
end
