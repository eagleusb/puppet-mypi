# == Class: mypi::httpd
#
class mypi::httpd {

  file { "${::mypi::params::extdrivepath}/log/apache":
    ensure  => directory,
    mode    => '0644',
    owner   => 'www-data',
    group   => 'www-data',
  }

  class { 'apache':
    default_vhost     => false,
    mpm_module        => 'prefork',
    default_ssl_cert  => "${::mypi::params::default_ssl_cert}",
    default_ssl_key   => "${::mypi::params::default_ssl_key}",
    logroot           => "${::mypi::params::extdrivepath}/log/apache",
    serveradmin       => 'leslie@morningopenstack.org',
    server_signature  => 'Off',
    server_tokens     => 'Minimal',
    purge_vhost_dir   => false,
  }

  class { 'apache::mod::ssl':
    ssl_compression       => false,
    ssl_honorcipherorder  => true,
    ssl_cipher            => 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256',
    ssl_protocol          => [ 'all', '-SSLv3', '-TLSv1', '-TLSv1.1', ],
  }

  include apache::mod::php
  include apache::mod::proxy
  include apache::mod::headers
  include apache::mod::rewrite

  apache::listen { [ '80', '443', ]: }

  apache::mod { [ 'proxy_http', ]: }

  apache::custom_config { 'default-tls':
    priority  => '01',
    source    => "puppet:///modules/${module_name}/httpd/default-tls",
  }



}
