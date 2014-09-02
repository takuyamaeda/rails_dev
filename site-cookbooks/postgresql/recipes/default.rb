#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "postgresql-server" do
  action :install
end
package "postgresql-devel" do
  action :install
end

execute "initdb" do
  #user "postgres"
  #command "initdb —encoding=UTF8 —no-locale"
  command "service postgresql initdb --encoding=UTF8 --nolocale"
  action :run
  not_if {::File.exist?("/var/lib/pgsql/data/pg_log")}
end

service "postgresql" do
  action [:enable, :start]
  supports :status => true, :restart => true, :reload => true
end
