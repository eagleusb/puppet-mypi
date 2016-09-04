# == Class: mypi::params
#
class mypi::params {

  $packages         = [ 'vim', 'git', 'nodejs', 'npm', 'apt-transport-https', 'apt-file', 'dnsutils', ]
  $extdrive         = '/dev/sda'
  $extdrivepath     = '/mnt/usbdrive01'
  $hostname         = 'eagleusb'
  $default_tls_crt  = '/etc/letsencrypt/live/morningopenstack.org/fullchain.pem'
  $default_tls_key  = '/etc/letsencrypt/live/morningopenstack.org/privkey.pem'
  $certbot_vtag     = 'v0.8.1'

}
