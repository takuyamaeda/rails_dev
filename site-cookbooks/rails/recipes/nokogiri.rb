#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "gcc" do
  action :install
end

package "ruby-devel" do
  action :install
end

package "libxml2" do
  action :install
end

package "libxml2-devel" do
  action :install
end

package "libxslt" do
  action :install
end

package "libxslt-devel" do
  action :install
end

ENV['NOKOGIRI_USE_SYSTEM_LIBRARIES'] = "YES"
gem_package "nokogiri" do
  version "1.6.1"
  #options("-- --use-system-libraries")
  options(" --platform=ruby -- --with-xml2-include=/local/include/libxml2 --with-xml2-lib=/local/lib --with-xslt-include=/local/include --with-xslt-lib=/local/lib")
  action :install
end
