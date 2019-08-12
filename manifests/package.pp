# Class: Package
#This class will install open source nginx
#
class nginx::package {
  package {['epel-release', 'nginx']:
    ensure => installed,
  }

  package {['gcc', 'make', 'automake', 'autoconf', 'libtool', 'pcre', 'pcre-devel', 'libxml2', 'libxml2-devel', 'curl', 'curl-devel', 'httpd-devel', '*gcc-c++*']:
    ensure => installed,
    }
}
