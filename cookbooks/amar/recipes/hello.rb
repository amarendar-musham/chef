#
# Cookbook:: amar
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.\
directory '/google' do
	action :create
end
file '/google/new.txt' do
	action :create
	content "new file created \n and just added this content \n"
end
template '/var/www/html/google.html' do
	source "google.html.erb"
end
bash 'creating a file ' do
	cwd '/tmp'
	code <<-EOH
	mkdir -p /google/New/Old
	echo "creating the first file\n in a subfolder" >>/google/New/Old/hi.txt
	EOH
end
