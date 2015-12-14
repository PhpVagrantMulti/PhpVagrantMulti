# -*- mode: ruby -*-
# vi: set ft=ruby :

require "./PhpVagrantMulti.rb"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # Vagrant PHP Multi Properties

  pvm = PhpVagrantMulti::PhpVagrantMultiSettings.new({
    # The directory you store your code on this computer
    # OOTB this is the same dir as your code root so the vm config can be easily provided with your code
    :local_code_dir => ".",

    ##
    # VM specific settings: these get plugged right in to the vagrant config.vm settings
    ##

    # The hostname of the machine
    :vm_hostname => "PhpVagrantMulti",

    # The ip address used to access the machine
    :vm_network_ip => "192.168.33.10",
    
    # Where the code from local_code_dir above lives on the vm
    :vm_code_dir => "/var/www/html/local.example.com",

    # Who owns the code directory
    :vm_code_dir_owner => "www-data",

    # Which group has rights to the directory 
    :vm_code_dir_group => "www-data",

    # The name of the vm in virtualbox/vmware/etc
    :vm_name => "PhpVagrantMulti",

    # Amount of memory on the vm in MB, 2048 because composer is a pig
    :vm_memory_mb => "2028",

    # Amount of v-cpus on the vm
    :vm_cpus => "2",

    ##
    # Feature settings: Toggles installation of certain features provided by PhpVagrantMulti including
    # various server software and some special features provided by PhpVagrantMulti
    ##

    # Enable SSL on host
    :vm_feature_ssl => true,
  
    # Install MySQL RDBMS
    :vm_feature_mysql => true,

    # Install PostgreSQL RDBMS
    :vm_feature_postgresql => false,

    # Install sqlite
    :vm_feature_sqlite => false,

    # Install Mongo DB
    :vm_feature_mongo_db => false,

    # Install redis
    :vm_feature_redis => false,

    # Install Memcached
    :vm_feature_memcached => false,

    # Install the solr
    :vm_feature_solr => false,

    # Install elastic search
    :vm_feature_elastic_search => false,

    # Install php_myadmin (cookbook provided by PhpVagrantMulti project)
    :vm_feature_php_myadmin => true,
    
    # Install xhgui profiler (cookbook provided by PhpVagrantMulti project)
    :vm_feature_xhgui => true,

    # Install mailcatcher
    :vm_feature_mailcatcher => true,

    # Install nginx as a web server
    :vm_feature_nginx => false,
        
    # Install apache as a web server. This option implies mod_php
    :vm_feature_apache_mpm_prefork => true,

    # Install apache as a web server. This option implies php5-fpm
    :vm_feature_apache_mpm_event => false,

    # Install gearman-server
    :vm_feature_gearman => false,

    ##
    # Specify the PHP Platform or framework being used. This isn't always needed
    # The main purpose of this is so that if a particular platform or framework is specified
    # Special cookbooks and/or packages could be installed to support special requirements
    ##
    :php_platform => PhpVagrantMulti::PhpVagrantMultiSettings.SUPPORTED_PLATFORMS[:CORE],

    # If you use silex or symfony set your project name here to ensure it's mapped correctly in the vhost
    :sensio_platform_project_name => "",

    ##
    # Cookbook Attribute Overrides
    ##

    # Top level domain, com, net, io, etc
    :vhost_tld => "com",

    # Domain name of your project site, example by default
    :vhost_domain_name => "example",

    :vhost_document_root => ""
  })

  # Berkshelf config

  config.berkshelf.berksfile_path = "Berksfile"
  config.berkshelf.enabled = true

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = pvm.vm_hostname

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: pvm.vm_network_ip

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  ##
  # Shared Folder Config
  ##
  shared_folders = [
    {
      :from => pvm.local_code_dir,
      :to   => pvm.vm_code_dir,
      :id   => "shared-root",
    }
  ]

  # Shared folder options
  shared_folders.each do |opts|
    config.vm.synced_folder opts[:from],
    opts[:to], 
    id: opts[:id],
    owner: pvm.vm_code_dir_owner,
    group: pvm.vm_code_dir_group,
    mount_options: ["ttl=1,dmode=775,fmode=775"]
  end

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

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--name", pvm.vm_name]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

    # composer is a pig, add more memory
    vb.customize ["modifyvm", :id, "--memory", pvm.vm_memory_mb]

    vb.customize ["modifyvm", :id, "--cpus", pvm.vm_cpus]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

  end

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    use_apache = pvm.vm_feature_apache_mpm_prefork || pvm.vm_feature_apache_mpm_event

    chef.add_recipe 'apt'
    chef.add_recipe 'vim'
    chef.add_recipe 'openssl' unless !pvm.vm_feature_ssl
    chef.add_recipe 'apache2' unless !use_apache
    chef.add_recipe 'apache2::mod_php5' unless !pvm.vm_feature_apache_mpm_prefork
    chef.add_recipe 'mysql::client' unless !pvm.vm_feature_mysql
    chef.add_recipe 'mysql::server' unless !pvm.vm_feature_mysql
    chef.add_recipe 'php'
    chef.add_recipe 'php::module_mysql'
    chef.add_recipe 'php::module_gd'
    chef.add_recipe 'php::module_curl'
    chef.add_recipe 'apt_packages' 
    chef.add_recipe 'php_environment'
    chef.add_recipe 'php_myadmin' unless !(pvm.vm_feature_mysql && pvm.vm_feature_php_myadmin)
    chef.add_recipe 'mailcatcher' unless !pvm.vm_feature_mailcatcher
    chef.add_recipe 'vhost' 
    chef.add_recipe 'xhgui' unless !pvm.vm_feature_xhgui
        
    chef.json = {}

    if use_apache
      apache_mpm = use_apache && pvm.vm_feature_apache_mpm_prefork ? "prefork" : "event"
      chef.json["apache"] = { "mpm" => apache_mpm }
    
      if pvm.vm_feature_ssl
        chef.json["apache"]["default_modules"] = ["ssl"]
      end
    end
 
    if pvm.vm_feature_mysql      
      chef.json["mysql"] = { 
        "version"                => "5.6",
        "server_root_password"   => "vagrant",
        "server_repl_password"   => "vagrant",    
        "server_debian_password" => "vagrant"
      }
    end
  
    chef.json["vhost"] = { 
      "ssl" => true,
      "tld" => pvm.vhost_tld,
      "domain_name" => pvm.vhost_domain_name,
      "document_root" => pvm.getVhostDocumentRoot()
    }

    chef.json["aptPackages"] = {
      "packages" => pvm.getAptPackages()
    }

    chef.json["phpEnvironment"] = {
        "packages" => pvm.getPhpPackages()
    }
    
  end 

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
