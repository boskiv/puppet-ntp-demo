$puppet_install = <<SCRIPT
rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
yum update -y
yum install puppet-agent -y
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"
  config.vm.synced_folder "environments/", "/etc/puppetlabs/code/environments/"  
  config.vm.provision "shell", inline: $puppet_install
end