# == Class: mypi::params
#
class mypi::params {

  $packages = [ 'vim', 'git', 'nodejs', 'npm', 'apt-transport-https', 'apt-file', 'dnsutils', ]
  $extdrive = '/dev/sda'
  $extdrivepath = '/mnt/usbdrive01'
  $hostname = 'eagleusb'

}
