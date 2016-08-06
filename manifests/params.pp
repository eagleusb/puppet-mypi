# == Class: mypi::params
#
class mypi::params {

  $packages = [ 'vim', 'git', ]
  $extdrive = '/dev/sda'
  $extdrivepath = '/mnt/usbdrive01'

}
