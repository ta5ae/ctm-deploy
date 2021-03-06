# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # https://docs.vagrantup.com.

  config.vm.box = "centos/7"

  config.vm.provision "shell", inline: <<-SHELL
    sudo timedatectl set-timezone Europe/London
    sudo yum update

    echo "Install dev utils"
    sudo yum install -y unzip
    sudo yum install -y nano

    echo "Install essential tools & repos"
    sudo yum install -y wget
    wget -N https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo rpm -ivh --replacepkgs epel-release-latest-7.noarch.rpm
  SHELL

  config.vm.define "web", primary: true do |web|
    web.vm.network "private_network", ip: "192.168.33.14"
    web.vm.provision :shell, path: "deploy.sh"
    web.vm.network "forwarded_port", guest: 8000, host: 8000
    # web.vm.synced_folder "src/", "/usr/local/ctm/src", type: "sshfs",
    #    owner: "vagrant", group: "vagrant", :mount_options => ['dmode=775', 'fmode=775', 'nonempty']
  end

  # TODO Configure DB set up or migrate to Docker ;)
  # config.vm.define "db", autostart: false do |db|
  #   db.vm.network "private_network", ip: "192.168.33.15"
  #   db.vm.network "forwarded_port", guest: 3306, host: 3306
  # end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

end
