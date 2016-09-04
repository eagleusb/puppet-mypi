# == Class: mypi::params
#
class mypi::params {

  $packages         = [ 'vim', 'git', 'nodejs', 'npm', 'apt-transport-https', 'apt-file', 'dnsutils', ]
  $extdrive         = '/dev/sda'
  $extdrivepath     = '/mnt/usbdrive01'
  $hostname         = 'eagleusb'
  $default_tls_crt  = '/etc/ssl/certs/let-front.pem'
  $default_tls_key  = '/etc/ssl/private/let-front.key'
  $certbot_vtag     = 'v0.8.1'

}
