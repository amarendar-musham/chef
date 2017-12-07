#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
admins = data_bag("userids")
admins.each do | login |
userv = data_bag_item("userids",login)
home = "/home/#{login}"

user "#{login}" do
        comment userv["comment"]
        uid userv["uid"]
        home home
        shell userv["shell"]
        password userv["password"]
	manage_home true
end

end
