# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos7_1"
  
  #config.vm.synced_folder ".", "/vagrant", type: "rsync"


################ Default virtual machine parameters ##############

   #Install puppet agent on virtual machine

   config.vm.provision "shell", inline: <<-SHELL
      sudo systemctl restart network  # For apply IP to eth1 Vagrant interface (bug fix)
      sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
      sudo yum -y install puppet-agent
      sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
      sudo /opt/puppetlabs/bin/puppet agent -t
   SHELL

#   # Configure network

#   config.vm.provider :libvirt do |vm|
#        vm.memory = 1000
#        vm.cpus = 2
#        vm.management_network_name = "mynetwork1"
#        vm.management_network_address = "192.168.33.0/24"
#        vm.management_network_mode = "route"
#   end

############### Nexus machine parameters #######################
 
  config.vm.define "nexus" do |nexus|
    nexus.vm.hostname = "nexus"
    nexus.vm.network "private_network", ip: "192.168.33.100"
    nexus.vm.provision "shell", inline: <<-SHELL
        echo 192.168.33.1 puppet.mynode.com puppet > /etc/hosts
        echo 192.168.33.100 nexus.mynode.com nexus >> /etc/hosts
        
        # Add 8081 tcp allow for Sonatype Nexus access
        sudo firewall-cmd --permanent --zone=public --add-port=8081/tcp
        sudo firewall-cmd --reload
        echo NETWORKING=yes > /etc/sysconfig/network
        echo HOSTNAME=nexus >> /etc/sysconfig/network
    SHELL
 end


##################### Test Maven machine parameters #############################

  config.vm.define "test" do |t|
    t.vm.hostname = "test"
    t.vm.network "private_network", ip: "192.168.33.105"
    t.vm.provision "shell", inline: <<-SHELL
        echo 192.168.33.1 puppet.mynode.com puppet >> /etc/hosts
	echo 192.168.33.105 test.mynode.com test >> /etc/hosts
	echo "NETWORKING=yes > /etc/sysconfig/network
        echo HOSTNAME=test >> /etc/sysconfig/network
   SHELL
  end
end
