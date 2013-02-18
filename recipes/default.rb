oracle_sqlplus_filename = node[:oracle][:oracle_sqlplus_install_filename]

execute 'copy oracle installation file' do
  command "cp #{node[:oracle][:oracle_sqlplus_install_source]}/#{oracle_sqlplus_filename} /tmp/"
  creates "/tmp/#{oracle_client_filename}"
end

%w{alien libaio1}.each do | pkg |
  package pkg do
    action :install
  end
end

execute 'install oracle sqlplus client' do
  user 'root'
  command "alien -i #{oracle_sqlplus_filename}"
  cwd '/tmp'
  action :run
  creates '/usr/lib/oracle/11.2'
end

cookbook_file '/etc/ld.so.conf.d/oracle.conf' do
  action :create
  source 'oracle.conf'
  mode 644
end

cookbook_file '/etc/profile.d/oracle.sh' do
  action :create
  source 'oracle.sh'
  mode 644
end

execute 'load libraries' do
  user 'root'
  command "ldconfig"
end