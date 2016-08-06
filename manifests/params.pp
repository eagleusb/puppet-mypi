# == Class: mypi::params
#
class mypi::params {

  $packages = [ 'vim', 'git', 'nodejs', 'npm', 'apt-transport-https' ]
  $extdrive = '/dev/sda'
  $extdrivepath = '/mnt/usbdrive01'

}
