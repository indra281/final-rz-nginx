# Class: Package
#This class will install open source nginx
#
class nginx::package {
  package {['epel-release', 'nginx']:
    ensure => installed,
  }

  package {['apt-utils', 'autoconf', 'automake', 'build-essential', 'git libcurl4-openssl-dev', 'libgeoip-dev', 'liblmdb-dev', 'libpcre++-dev', 'libtool', 'libxml2-dev', 'libyajl-dev', 'pkgconf', 'wget', 'zlib1g-dev']:
    ensure => installed,
    }
}
