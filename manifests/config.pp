# Class: config
# This class will configure nginx as per rz env
#
class nginx::config {
  file {'/etc/nginx/conf.d':
  ensure => directory,
  owner  => 'nginx',
  mode   => '0750'
  }

  file {'/etc/nginx/modules':
  ensure => directory,
  owner  => 'nginx',
  mode   => '0750',
  }

  exec { 'git clone --depth 1 -b v3/master --single-branch https://github.com/SpiderLabs/ModSecurity':
    cwd  => '/home',
    path => ['/usr/bin', '/usr/sbin',],
  }

  exec {'git submodule init':
        cwd     => '/home/ModSecurity',
        command => 'git submodule init' ,
        path    => ['/usr/bin', '/usr/sbin',],
    }

  exec {'git submodule update':
        cwd     => '/home/ModSecurity',
        command => 'git submodule update' ,
        path    => ['/usr/bin', '/usr/sbin',],
    }

  exec {'run build.sh':
        cwd     => '/home/ModSecurity',
        command => './build.sh' ,
        path    => ['/usr/bin', '/usr/sbin',],
    }

  exec {'run configure':
        cwd     => '/home/ModSecurity',
        command => './configure' ,
        path    => ['/usr/bin', '/usr/sbin',],
    }

  exec {'Make it ':
        cwd     => '/home/ModSecurity',
        command => 'make' ,
        path    => ['/usr/bin', '/usr/sbin',],
    }

  exec {'Make install ':
        cwd     => '/home/ModSecurity',
        command => 'make install' ,
        path    => ['/usr/bin', '/usr/sbin',],
    }
}
