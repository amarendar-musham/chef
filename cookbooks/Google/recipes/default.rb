#
# Cookbook:: Google
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
directory '/google' do
	action :create
end
file '/google/newfile.txt' do
	action :create
	content "the first file created \n having info about configuration management \n good morning \n"
end
package 'httpd' do
	action :install
end
service 'httpd' do
	action [:enable, :start]
end
file '/var/www/html/index.html' do
	action :create
	content "<html><body><h1>Good morning google</h1></body></html>"
end
