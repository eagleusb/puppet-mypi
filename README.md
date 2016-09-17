# Pre-requisites

* root access
* puppet
  * puppetlabs-apache
  * theforeman-git
* facter
* interweb

# Classes

* mypi
* mypi::core
* mypi::opt
* mypi::httpd
* mypi::node
* mypi::params

# Installation (manual)

      mv puppet-mypi /etc/puppet/modules/mypi

# Running

      puppet apply --test -e "include mypi"
