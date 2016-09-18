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

  exec { 'rainloop':
    command => "/usr/bin/wget -q ${::mypi::params::rainloop_src} -O ${::mypi::params::extdrivepath}/www/rainloop.zip",
    creates => "${::mypi::params::extdrivepath}/www/rainloop",
  }

  exec { 'miniflux':
    command => "/usr/bin/wget -q ${::mypi::params::miniflux_src} -O - | tar xzf - -C ${::mypi::params::extdrivepath}/www",
    creates => "${::mypi::params::extdrivepath}/www/miniflux",
  }

  ->

  file { '/etc/letsencrypt/cli.ini':
    ensure  => file,
    mode    => '0640',
    content => template("${module_name}/cli.ini.erb"),
  }

  cron { 'certbot_renewal':
    command   => "${::mypi::params::extdrivepath}/opt/certbot/certbot-auto renew --quiet --no-self-upgrade",
    user      => 'root',
    monthday  => '1'
  }

  cron { 'miniflux_updates':
    command => "php ${::mypi::params::extdrivepath}/www/miniflux/cronjob.php --limit 100 >/dev/null 2>&1",
    user    => 'root',
    hour    => 4,
  }

}
