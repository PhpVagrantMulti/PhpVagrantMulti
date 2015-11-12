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

The tool provides a virtual machine with one vhost for your project, php myadmin for database development and xhgui for profiling. It also provides mailcatcher for advanced email testing along with a small set of shell scripts available within /home/vagrant used to enable/disable mailcatcher and switch the PHP config quickly between development and performance mode.

Requirements
------------

Most recent version of Vagrant                          https://www.vagrantup.com/downloads.html
Most recent version of chef-dk (required for berkshelf) https://downloads.chef.io/chef-dk/

Installation
------------

All that is needed to start using PhpVagrantMulti is to clone the repository and copy the following files into your the directory where your source code lives:

Berksfile
metadata.rb
PhpVagrantMulti.rb
Vagrantfile
init.sh
init.bat

Run init.sh for your initial vagrant up. Each subsequent run can be performed with vagrant up.

Configuration
-------------

Inside of your Vagrantfile near the top you will find an class instance being assigned to a reference called pvm. The class is being initialized via a hash. All you have to do is tweak the values set up in the hash to configure your vm. The rest of the Vagrant file can of course be modified but there is no need to do so for values provided within pvm.

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

This class holds the configuration parameters for PhpVagrantMulti
