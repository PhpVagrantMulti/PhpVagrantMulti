CONTENTS OF THIS FILE
---------------------
    
 * Introduction
 * Requirements
 * Installation
 * Configuration
 * License

Introduction
------------

Php Vagrant Multi Purpose VM is a vagrant config hack and set of cookbooks that facilitate the provisioning of PHP development virtual machines using Vagrant. The goal of this project is to provide a single, configurable, easy to use vagrant configuration for all kinds of PHP development projects.

The tool provides:

 * A vhost for your project
 * PhpMyAdmin at local.phpmyadmin.com
 * xhprof and a fully configured xhgui at local.xhgui.com for graphical profiling.
 * mailcatcher for advanced email testing, (available at the vm ip address and port 1080, ie 192.168.33.10:1080)

 * Out of the box phing
 * Turn key xdebug especially configured for use with PHP Storm IDE connections
 * vm_mode.sh script that instantly switches your php environment to performance mode (opcache, no xdebug no xhgui) to debug mode with a simple command


Requirements
------------

Most recent version of Vagrant                          https://www.vagrantup.com/downloads.html<br>
Most recent version of chef-dk (required for berkshelf) https://downloads.chef.io/chef-dk/<br>  

Installation and Quick Start
----------------------------

All that is needed to start using PhpVagrantMulti is to clone the repository and copy the following files into your the directory where your source code lives:

```
Berksfile
metadata.rb
PhpVagrantMulti.rb
Vagrantfile
init.sh
init.bat
```

On unix style systems:

 1. Run init.sh for your initial vagrantup
 2. Modify /etc/hosts to include the ip address of the vm to point to:
    - local.phpmyadmin.com
    - local.xhgui.com
    - local.projectsitename.tld where projectsitename is is the domain name of your project and tld is your top level domain.

For example if you are using the default ip address:

```
192.168.33.10 local.phpmyadmin.com
192.168.33.10 local.xhgui.com
192.168.33.10 local.example.com
```

On windows systems:

 1. Run init.bat from a cmd window:
 2. Modify c:\Windows\System32\Drivers\etc\hosts to include the ip address of the vm to point to:
    - local.phpmyadmin.com
    - local.xhgui.com
    - local.projectsitename.tld where projectsitename is is the domain name of your project and tld is your top level domain.

For example if you are using the default ip address:

```
192.168.33.10 local.phpmyadmin.com
192.168.33.10 local.xhgui.com
192.168.33.10 local.example.com
```

Finally, each subsequent run can be performed with a normal vagrant up.

To run xhgui profiling you have to edit your vhost config and uncomment the line that reads:

```
 #php_admin_value auto_prepend_file "/var/www/html/local.xhgui.com/external/header.php"
```

and restart your web server

In your /home/vagrant directory on the vm there is a script called vm_mode.sh. Run this script as root to switch between performance mode and development mode. In performance mode profiling and debugging are disabled and opcache is enabled. In developent mode profiling and debugging are enabled and opcache is disabled. This was provided as a sanity check to get closer to production level performance by eliminating overhead and introducing opcache to the php environment.

Configuration
-------------

Inside of your Vagrantfile near the top you will find an class instance being assigned to a reference called pvm. The class is being initialized via a hash. All you have to do is tweak the values set up in the hash to configure your vm. The rest of the Vagrant file can of course be modified but there is no need to do so for values provided within the pvm instance.

License
-------

This file is part of PhpVagrantMulti.
PhpVagrantMulti is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

PhpVagrantMulti is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with PhpVagrantMulti.  If not, see <http://www.gnu.org/licenses/>.
