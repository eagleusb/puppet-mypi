# == Class: mypi::node
#
class mypi::node {

  exec { 'nodejs_get':
    command => "/usr/bin/wget -q ${::mypi::params::nodejs_src} -O - | /usr/bin/xz -d - | /bin/tar xf - -C ${::mypi::params::extdrivepath}/opt",
    creates => "${::mypi::params::extdrivepath}/opt/node-v4.5.0-linux-armv6l",
  }

  ~>

  file { "${::mypi::params::extdrivepath}/opt/node-v4.5.0-linux-armv6l":
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    recurse => true,
  }

  exec { 'node':
    command => '/usr/sbin/update-alternatives --install /usr/bin/node node /mnt/usbdrive01/opt/node-v4.5.0-linux-armv6l/bin/node 1',
    refreshonly => true,
  }

  exec { 'npm':
    command => '/usr/sbin/update-alternatives --install /usr/bin/npm npm /mnt/usbdrive01/opt/node-v4.5.0-linux-armv6l/bin/npm 1',
    refreshonly => true,
  }


}
