# == Class: mypi
#
# === Authors
#
# Leslie-Alexandre DENIS <leslie@morningopenstack.org>
#
# === Copyright
#
# Copyright 2016 Leslie-Alexandre DENIS
#
class mypi {

  if ($hardwaremodel == 'armv6l' and $osfamily == 'Debian') {
    notify { 'Welcome, this brand new RaspberryPi will be pimped': }

    require mypi::params
    include mypi::core
    include mypi::opt
    include mypi::httpd
    include mypi::node
  }

}
