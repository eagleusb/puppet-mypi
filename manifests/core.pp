# == Class: mypi::core
#
class mypi::core {

  package { $::mypi::params::packages:
    ensure => installed,
  }

  file { '/opt':
    ensure => directory,
    mode => '0644',
  }

  file { '/opt/tools':
    ensure => directory,
    mode => '0770',
  }

  file { "$::mypi::params::extdrivepath":
    ensure => directory,
    mode => '0755',
  }

  user { 'pi':
    ensure => absent,
  }

  user { 'pad':
    comment => 'I take notes',
    home => '/nonexistent',
    ensure => present,
    shell => '/usr/sbin/nologin',
  }

  if 'sda' in "$blockdevices" {
    file_line { 'fstab':
      ensure => present,
      path   => '/etc/fstab',
      line   => "$::mypi::params::extdrive $::mypi::params::extdrivepath ext4 defaults,noatime,nodiratime,nodev,nofail  0 1",
    } ~> exec { 'mounts':
      command => '/bin/mount -a',
      refreshonly => true,
    }
  }


}
