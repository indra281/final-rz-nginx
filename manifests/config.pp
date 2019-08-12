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
    }

  exec {'git submodule update':
        cwd     => '/home/ModSecurity',
        command => 'git submodule update' ,
    }

  exec {'run build.sh':
        cwd     => '/home/ModSecurity',
        command => './build.sh' ,
    }

  exec {'run configure':
        cwd     => '/home/ModSecurity',
        command => './configure' ,
    }

  exec {'Make it ':
        cwd     => '/home/ModSecurity',
        command => 'make' ,
    }

  exec {'Make install ':
        cwd     => '/home/ModSecurity',
        command => 'make install' ,
    }
}
