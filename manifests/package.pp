# Class: Package
#This class will install open source nginx
#
class nginx::package {

  exec {'Install repo  ':
        logoutput => true,
        command   => 'yum -y install https://extras.getpagespeed.com/release-el7-latest.rpm',
        path      => ['/usr/bin', '/usr/sbin',],
    }

  package {'Install nginx package':
  ensure    => installed,
  name      => 'nginx',
  logoutput => true,
  }

  package {'Install mod security':
  ensure    => installed,
  name      => 'nginx-module-security',
  logoutput => true,
  }

  package {'Install owasp-crs':
  ensure    => installed,
  name      => 'nginx-owasp-crs',
  logoutput => true,
  }
}

