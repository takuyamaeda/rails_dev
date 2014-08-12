#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
# http://qiita.com/ryurock/items/f0ef33639c188a5965c7

# rbenvグループを作成し、vagrantユーザを追加
group "rbenv" do
  action :create
  members "vagrant"
  append true
end


# gitからrbenvをダウンロード (node.userはroot )
git "/usr/local/rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
  user "#{node.user}"
  group "rbenv"
end

# rbenvのbash設定
template "etc/profile.d/rbenv.sh" do
  owner "#{node.user}"
  group "#{node.user}"
  mode "0644"
end

# ruby-build用のpluginフォルダを作成
directory "/usr/local/rbenv/plugins" do
  owner "#{node.user}"
  group "rbenv"
  mode "0755"
  action :create
end 

git "/usr/local/rbenv/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  user "#{node.user}"
  group "rbenv"
end
