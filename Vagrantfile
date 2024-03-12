# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'vagrant_vars'

Vagrant.configure("2") do |config|

  # First application VM
  config.vm.define "app" do |app|
    app.vm.box_check_update = false
    app.vm.box = "debian/bullseye64"
    app.vm.hostname = "app.local"
    app.vm.network :private_network, ip: IP_APP_MAIN, netmask: "255.255.255.0", hostname: true
    app.vm.synced_folder '.', '/vagrant', disabled: true
    app.vm.provider "virtualbox" do |vb|
      vb.name = "First App VM"
    end
  end

  # Second application VM
  config.vm.define "app2" do |app2|
    app2.vm.box_check_update = false
    app2.vm.box = "debian/bullseye64"
    app2.vm.hostname = "app-2.local"
    app2.vm.network :private_network, ip: IP_APP_SEC, netmask: "255.255.255.0", hostname: true
    app2.vm.synced_folder '.', '/vagrant', disabled: true
    app2.vm.provider "virtualbox" do |vb|
      vb.name = "Second App VM"
    end
  end

  # Developer VM
  config.vm.define "dev", primary: true do |dev|
    dev.vm.box = "debian/bullseye64"
    dev.vm.hostname = "dev.local"
    dev.vm.network :private_network, ip: IP_DEV, netmask: "255.255.255.0", hostname: true
    dev.vm.synced_folder '.', '/vagrant', disabled: true
    dev.vm.provider "virtualbox" do |vb|
      vb.name = "Developer VM"
    end
    # Install desktop environment
    dev.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y xfce4
      sudo startx &
    SHELL
    dev.vm.provision :reload
  end

  # Database VM
  config.vm.define "db" do |db|
    db.vm.box_check_update = false
    db.vm.box = "debian/bullseye64"
    db.vm.hostname = "db.local"
    db.vm.network :private_network, ip: IP_DB, netmask: "255.255.255.0", hostname: true
    db.vm.synced_folder '.', '/vagrant', disabled: true
    db.vm.provider "virtualbox" do |vb|
      vb.name = "Database VM"
    end
  end

  # Mail server VM
  config.vm.define "mail" do |mail|
    mail.vm.box_check_update = false
    mail.vm.box = "debian/bullseye64"
    mail.vm.hostname = "mx.local"
    mail.vm.network :private_network, ip: IP_MAIL, netmask: "255.255.255.0", hostname: true
    mail.vm.synced_folder '.', '/vagrant', disabled: true
    mail.vm.provider "virtualbox" do |vb|
      vb.name = "Mail server VM"
    end
  end

  # Provider configuration
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 2
  end
end