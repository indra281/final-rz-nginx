# Class: Package
#This class will install open source nginx
#
class nginx::package {

  exec {'Copy objs  ':
        logoutput => true,
        command   => 'yum -y install https://extras.getpagespeed.com/release-el7-latest.rpm',
        path      => ['/usr/bin', '/usr/sbin',],
    }

  package {['nginx', 'nginx-module-security', 'nginx-owasp-crs']:
    ensure => installed,
  }


