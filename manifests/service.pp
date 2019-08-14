# Class: service.pp
# this class will start the nginx service  
#
class nginx::service {
  service {'Start the nginx process':
    ensure => running,
    name   => 'nginx',
    enable => true,
    }
}
