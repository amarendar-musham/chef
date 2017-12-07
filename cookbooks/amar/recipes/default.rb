#
# Cookbook:: amar
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.\
package node["package_name"] do
	action :install
end
service node["service_name"] do
	action [:enable, :start]
end
template "#{node["document_root"]}/index.html" do
	source "index.html.erb"
end
bash "setting enforce" do
	cwd "/tmp"
	code <<-EOH
	if [ #{node["platform"]} == "centos" ] ; then
	setenforce 0 ; fi
	EOH
end
###daf
if "#{node["platform"]}" == "ubuntu"
template "/etc/apache2/ports.conf" do
        source "ports.conf.erb"	
end
else
template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
end
end
###daf
bash "restarting service" do
        cwd "/tmp"
        code <<-EOH
        sudo service #{node["service_name"]} restart
        EOH
end
##
