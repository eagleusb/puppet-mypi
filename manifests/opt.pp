# == Class: mypi::opt
#
class mypi::opt {

  file { [ "${::mypi::params::extdrivepath}/opt", "${::mypi::params::extdrivepath}/log" ]:
    ensure => directory,
    mode => '0755',
  }

  ->

  exec { 'etherpad':
    command => "/usr/bin/git clone -b develop --progress https://github.com/ether/etherpad-lite.git ${::mypi::params::extdrivepath}/opt/etherpad",
    creates => "${::mypi::params::extdrivepath}/opt/etherpad",
  } ~> file { "${::mypi::params::extdrivepath}/opt/etherpad":
        ensure  => directory,
        owner   => 'pad',
        group   => 'pad',
        recurse => true,
        require => [ User['pad'] ],
      }

  exec { 'certbot':
    command => "/usr/bin/git clone -b ${::mypi::params::certbot_vtag} --progress https://github.com/certbot/certbot.git ${::mypi::params::extdrivepath}/opt/certbot",
    creates => "${::mypi::params::extdrivepath}/opt/certbot",
  } ~> file { "${::mypi::params::extdrivepath}/opt/certbot/certbot-auto":
    mode => '0770',
  }

  cron { 'certbot_renewal':
    command   => "${::mypi::params::extdrivepath}/opt/certbot/certbot-auto renew --quiet --no-self-upgrade",
    user      => 'root',
    monthday  => '1'
  }

}
