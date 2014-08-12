package "sqlite-devel" do
  action :install
end

gem_package "sqlite3" do
  gem_binary("/usr/local/rbenv/shims/gem")
  action :install
end
