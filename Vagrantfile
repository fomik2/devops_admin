# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "centos7_1"
  
  #config.vm.synced_folder ".", "/vagrant", type: "rsync"

#Nexus machine
 
  config.vm.define "nexus" do |nexus|
      nexus.vm.provision "shell", inline: <<-SHELL
        rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
        yes | yum -y install puppet
        hostname nexus
        echo domain mynode.com >> /etc/resolv.conf
	yum group install -y "Development Tools"
	yum install -y nano
        puppet module install hubspot-nexus --version 1.7.1
	puppet module install puppetlabs-java --version 1.6.0
	puppet apply /vagrant/nexus.pp
      SHELL
    nexus.vm.network "private_network", ip: "192.168.33.110"
    nexus.vm.provider :libvirt do |vm|
      vm.memory = 1000
      vm.cpus = 2
    end    
  end


#Maven machine

  config.vm.define "work" do |t|
    t.vm.provision "shell", inline: <<-SHELL
        rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
        yes | yum -y install puppet
        hostname work
        echo domain mynode.com >> /etc/resolv.conf
	yum install -y java-1.8.0-openjdk-devel
	yum install -y nano
	yum group install -y "Development Tools"
	yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel
	yum install -y git
	yum install -y wget
	sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
	sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
	sudo yum install -y apache-maven 
   SHELL
    t.vm.provision "puppet" do |puppet|
	puppet.manifest_path = "manifests"
	puppet.manifest_file = "work.pp"
    end
    t.vm.network "private_network", ip: "192.168.33.100"
    t.vm.provider :libvirt do |vm|
        vm.memory = 1000
        vm.cpus = 2
    end
 end

#test machine

 config.vm.define "test" do |t|
    t.vm.provision "shell", inline: <<-SHELL
        rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
        yes | yum -y install puppet
        hostname test
        echo domain mynode.com >> /etc/resolv.conf
        yum install -y java-1.8.0-openjdk-devel
        yum install -y nano
        yum group install -y "Development Tools"
        yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel
        yum install -y git
        yum install -y wget
	sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O \
 	/etc/yum.repos.d/epel-apache-maven.repo
        sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
        sudo yum install -y apache-maven
   SHELL
    t.vm.provision "puppet" do |puppet|
        puppet.manifest_file = "work.pp"
	puppet.module_path = "/etc/puppet/modules"
    end

    t.vm.provider :libvirt do |vm|
        vm.memory = 1000
        vm.cpus = 2
	vm.management_network_name = "mynetwork1"
	vm.management_network_address = "192.168.33.0/24"
	vm.management_network_mode = "route"
    end
 end


end

