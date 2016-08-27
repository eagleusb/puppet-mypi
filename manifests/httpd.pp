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
    default_ssl_cert  => '/etc/ssl/certs/ssl-cert-snakeoil.pem',
    default_ssl_key   => '/etc/ssl/private/ssl-cert-snakeoil.key',
    logroot           => "${::mypi::params::extdrivepath}/log/apache",
    serveradmin       => 'leslie@morningopenstack.org',
    server_signature  => 'off',
    server_tokens     => 'Min',
  }

  class { 'apache::mod::ssl':
    ssl_compression => false,
    ssl_cipher      => 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256',
    ssl_protocol    => [ 'all', '-SSLv3', '-TLSv1', '-TLSv1.1', ],
  }

  include apache::mod::php

}
