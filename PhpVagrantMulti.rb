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
    attr_accessor :vm_feature_sqlite
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
    attr_accessor :vm_feature_gearman
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

    def getAptPackages
      packages = %w{build-essential php5-dev unzip php-pear ruby-dev git}

      if self.vm_feature_memcached
        packages.push("memcached")
      end

      if self.vm_feature_redis
        packages.push("redis-server")
      end

      if self.vm_feature_gearman
        packages.push("gearman-server")
      end

      if self.vm_feature_sqlite
        packages.push("sqlite3")
        packages.push("sqlite3-dev")
      end

      return packages
    end

    def getPhpPackages
      packages = %w{
        php5-imagick
        php5-geoip
        php5-gmp
        php5-imap
        php5-intl
        php5-mcrypt
        php5-mhash
        php5-mysqlnd
        php5-mysqlnd-ms
        php5-oauth
        php5-ps
        php5-pspell
        php5-recode
        php5-tidy
        php5-xdebug
        php5-xhprof
        php5-xmlrpc
        php5-xsl
      }

      if self.vm_feature_memcached
        packages.push("php5-memcached")
        packages.push("php5-memcache")
      end

      if self.vm_feature_redis
        packages.push("php5-redis")
      end

      if self.vm_feature_gearman
        packages.push("php5-gearman")
      end

      if self.vm_feature_sqlite
        packages.push("php5-sqlite")
      end

      return packages
    end
  end
end
