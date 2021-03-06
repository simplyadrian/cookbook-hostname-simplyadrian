#
# Cookbook Name:: hostname-simplyadrian
# Recipe:: updatehostname
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

# Set the FQDN for the node
full_nodename = node.name
full_nodename = "#{node.name}.#{node['hostname-simplyadrian']['domain_name']}" unless
  node.name.include? "#{node['hostname-simplyadrian']['domain_name']}"


if platform_family?('debian')

  # Create the hosts file
  hostsfile_entry node['ipaddress'] do
    hostname  "#{full_nodename}"
    action    :create
  end

  # Write the FQDN to the hostname file
  File.open('/etc/hostname', 'w') {|f| f.write("#{full_nodename}") }

else

  # Create the hosts file
  hostsfile_entry node['ipaddress'] do
    hostname  "#{full_nodename}"
    action    :create
  end

  # Write the FQDN to the hostname file
  File.open('/etc/hostname', 'w') {|f| f.write("#{full_nodename}") }

  # Set the files to search/replace in the sysconfig directory
  files = ['/etc/sysconfig/network']

  # Then set the variables for find/replace
  @original_string_or_regex = /HOSTNAME=.*/
  @replacement_string = "HOSTNAME=#{full_nodename}"

  # Do the find/replace
  files.each do |file_name|
    text = File.read(file_name)
    replace = text.gsub!(@original_string_or_regex, @replacement_string)
    File.open(file_name, "w") { |file| file.puts replace }
  end
end

# Set the hostname using the hostname command
bash "set hostname" do
  user "root"
  code <<-EOH
  (hostname #{full_nodename})
  EOH
end
