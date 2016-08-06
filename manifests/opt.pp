# == Class: mypi::opt
#
class mypi::opt {

  file { "${::mypi::params::extdrivepath}/opt":
    ensure => directory,
    mode => '0755',
  }

  ->

  exec { 'etherpad':
    command => "/usr/bin/git clone -b develop --progress https://github.com/ether/etherpad-lite.git ${::mypi::params::extdrivepath}/opt/etherpad",
    creates => "${::mypi::params::extdrivepath}/opt/etherpad"
  }

}
