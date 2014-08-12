#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "resolv.option" do
  not_if "grep 'options single-request-reopen' /etc/resolv.conf"
  command "echo 'options single-request-reopen' >> /etc/resolv.conf"
  action :run
end

gem_package "rails" do
  gem_binary("/usr/local/rbenv/shims/gem")
  action :install
end

execute "rbenv rehash" do
  command "source /etc/profile.d/rbenv.sh;rbenv rehash"
  action :run  
end
