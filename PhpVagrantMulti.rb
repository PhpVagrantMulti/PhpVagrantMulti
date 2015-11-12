##
# PhpVagrantMulti.rb 
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

# This class holds the configuration parameters for PhpVagrantMulti

module PhpVagrantMulti
  class PhpVagrantMultiSettings
    @@SUPPORTED_PLATFORMS = {
      :CORE         => 0,
      :ZEND         => 1,
      :SYMFONY      => 2,
      :MAGENTO      => 3,
      :LARVEL       => 4,
      :YII          => 5,
      :WORDPRESS    => 6,
      :JOOMLA       => 7,
      :DRUPAL       => 8,
      :CODE_IGNITER => 9,
      :SUGAR_CRM    => 10
    }

    attr_accessor :local_code_dir
    attr_accessor :vm_hostname
    attr_accessor :vm_network_ip
    attr_accessor :vm_code_dir
    attr_accessor :vm_code_dir_owner
    attr_accessor :vm_code_dir_group
    attr_accessor :vm_name

    attr_accessor :vm_memory_mb
    attr_accessor :vm_cpus

    attr_accessor :vm_feature_ssl
    attr_accessor :vm_feature_mysql
    attr_accessor :vm_feature_postgresql
    attr_accessor :vm_feature_mongo_db
    attr_accessor :vm_feature_redis
    attr_accessor :vm_feature_memcached
    attr_accessor :vm_feature_solr
    attr_accessor :vm_feature_elastic_search
    attr_accessor :vm_feature_php_myadmin
    attr_accessor :vm_feature_xhgui
    attr_accessor :vm_feature_mailcatcher
    attr_accessor :vm_feature_nginx
    attr_accessor :vm_feature_apache_mpm_prefork
    attr_accessor :vm_feature_apache_mpm_event
    attr_accessor :php_platform

    def initialize args
      args.each do |k,v|
        symbol = "@#{k}";
        instance_variable_set(symbol, v)
      end
    end 

    def self.SUPPORTED_PLATFORMS
      @@SUPPORTED_PLATFORMS
    end
  end
end
