# Class: Package
#This class will install open source nginx
#
class nginx::package {
  package {['epel-release', 'nginx']:
    ensure => installed,
  }
}
