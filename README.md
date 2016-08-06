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
* mypi::params

# Running

      puppet apply --test -e "include mypi"
