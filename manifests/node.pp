# == Class: mypi::node
#
class mypi::node {

  exec { 'nodejs_get':
    command => "/usr/bin/wget -q ${::mypi::params::nodejs_src} -O - | /usr/bin/xz -d - | /bin/tar xf - -C ${::mypi::params::extdrivepath}/opt",
    creates => "${::mypi::params::extdrivepath}/opt/${::mypi::params::nodejs_path}",
  }

  ~>

  file { "${::mypi::params::extdrivepath}/opt/${::mypi::params::nodejs_path}":
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    recurse => true,
  }

  exec { 'node':
    command     => "/usr/sbin/update-alternatives --install /usr/bin/node node ${::mypi::params::extdrivepath}/opt/${::mypi::params::nodejs_path}/bin/node 1",
    refreshonly => true,
  }

  exec { 'npm':
    command     => "/usr/sbin/update-alternatives --install /usr/bin/npm npm ${::mypi::params::extdrivepath}/opt/${::mypi::params::nodejs_path}/bin/npm 1",
    refreshonly => true,
  }


}
