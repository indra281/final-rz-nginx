# Class: service.pp
# this class will start the nginx service  
#
class nginx::service {
  service {'nginx':
    ensure => running,
    enable => true,
    }
}
