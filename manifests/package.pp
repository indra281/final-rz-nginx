# Class: Package
#This class will install open source nginx
#
class nginx::package {
  package {['https://extras.getpagespeed.com/release-el7-latest.rpm', 'nginx']:
    ensure => installed,
  }


