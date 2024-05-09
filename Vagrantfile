# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative "vagrant_vars"

Vagrant.configure("2") do |config|
  # Hostmanager plugin configuration
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  # First application VM
  config.vm.define "tomcat" do |tomcat|
    tomcat.vm.box_check_update = false
    tomcat.vm.box = "debian/bullseye64"
    tomcat.vm.hostname = "tomcat"
    tomcat.hostmanager.aliases = %w(tomcat.vagrant.local)
    tomcat.vm.network :private_network, ip: IP_APP_MAIN, netmask: "255.255.255.0"
    tomcat.vm.network "forwarded_port", guest: 8080, host: 8080
    tomcat.vm.synced_folder ".", "/vagrant", disabled: true
    tomcat.vm.provider "virtualbox" do |vb|
      vb.name = "Tomcat VM"
    end
  end

  # Second application VM
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box_check_update = false
    jenkins.vm.box = "debian/bullseye64"
    jenkins.vm.hostname = "jenkins"
    jenkins.hostmanager.aliases = %w(jenkins.vagrant.local)
    jenkins.vm.network :private_network, ip: IP_APP_SEC, netmask: "255.255.255.0"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8081
    jenkins.vm.synced_folder ".", "/vagrant", disabled: true
    jenkins.vm.provider "virtualbox" do |vb|
      vb.name = "Jenkins VM"
    end
  end

  # Developer VM
  config.vm.define "dev", primary: true do |dev|
    dev.vm.box = "debian/bullseye64"
    dev.vm.hostname = "dev"
    dev.hostmanager.aliases = %w(dev.vagrant.local)
    dev.vm.network :private_network, ip: IP_DEV, netmask: "255.255.255.0"
    dev.vm.synced_folder ".", "/vagrant", disabled: true
    dev.vm.provider "virtualbox" do |vb|
      vb.name = "Developer VM"
    end
  end

  # Database VM
  config.vm.define "db" do |db|
    db.vm.box_check_update = false
    db.vm.box = "debian/bullseye64"
    db.vm.hostname = "db"
    db.hostmanager.aliases = %w(db.vagrant.local)
    db.vm.network :private_network, ip: IP_DB, netmask: "255.255.255.0"
    db.vm.synced_folder ".", "/vagrant", disabled: true
    db.vm.provider "virtualbox" do |vb|
      vb.name = "Database VM"
    end
  end

  # Mail server VM
  config.vm.define "mail" do |mail|
    mail.vm.box_check_update = false
    mail.vm.box = "debian/bullseye64"
    mail.vm.hostname = "mx"
    mail.hostmanager.aliases = %w(mx.vagrant.local)
    mail.vm.network :private_network, ip: IP_MAIL, netmask: "255.255.255.0"
    mail.vm.network "forwarded_port", guest: 25, host: 25
    mail.vm.synced_folder ".", "/vagrant", disabled: true
    mail.vm.provider "virtualbox" do |vb|
      vb.name = "Mail server VM"
    end
  end

  # Provider configuration
  config.vm.provider "virtualbox" do |vb|
    vb.linked_clone = true
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--groups", "/Vagrant"]
  end
end