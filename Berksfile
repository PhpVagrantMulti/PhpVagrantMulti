##
# Berksfile
# PhpVagrantMulti - PHP vagrant multipurpose vm
#
# AUTHORS::   Seth Griffin <griffinseth@yahoo.com>
# Copyright:: Copyright 2015 Authors
# License::   GPLv3
#
# This file is part of PhpVagrantMulti.
# PhpVagrantMulti is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# PhpVagrantMulti is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with PhpVagrantMulti.  If not, see <http://www.gnu.org/licenses/>.
##


source "https://supermarket.chef.io"

metadata

cookbook "apt"
cookbook "vim"
cookbook "mysql"
cookbook "openssl"
cookbook "apache2"
cookbook "php"

cookbook "apt_packages", git: "https://github.com/PhpVagrantMulti/apt_packages.git" 
cookbook "php_environment", git: "https://github.com/PhpVagrantMulti/php_environment.git"
cookbook "php_myadmin", git: "https://github.com/PhpVagrantMulti/php_myadmin.git"
cookbook "vhost", git: "https://github.com/PhpVagrantMulti/vhost.git"
cookbook "xhgui", git: "https://github.com/PhpVagrantMulti/xhgui.git"
cookbook "mailcatcher", git: "https://github.com/PhpVagrantMulti/mailcatcher.git"
