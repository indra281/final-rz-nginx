# Class: config
# This class will configure nginx as per rz env
#
class nginx::config {
  exec { 'Clone ModSecurity Module':
    command   => 'git clone --depth 1 -b v3/master --single-branch https://github.com/SpiderLabs/ModSecurity',
    logoutput => true,
    cwd       => '/home',
    path      => ['/usr/bin', '/usr/sbin',],
  }

  exec {'git submodule init':
        cwd       => '/home/ModSecurity',
        logoutput => true,
        timeout   => 10000,
        command   => 'git submodule init' ,
        path      => ['/usr/bin', '/usr/sbin',],
    }

  exec {'git submodule update':
        cwd       => '/home/ModSecurity',
        logoutput => true,
        timeout   => 10000,
        command   => 'git submodule update' ,
        path      => ['/usr/bin', '/usr/sbin',],
    }

  exec {'run build.sh':
        cwd       => '/home/ModSecurity',
        logoutput => false,
        command   => 'bash build.sh' ,
        timeout   => 10000,
        path      => ['/usr/bin', '/usr/sbin',],
    }

  exec {'run configure':
        cwd       => '/home/ModSecurity',
        logoutput => true,
        timeout   => 10000,
        command   => 'bash configure' ,
        path      => ['/usr/bin', '/usr/sbin',],
    }

  exec {'Make it ':
        cwd       => '/home/ModSecurity',
        logoutput => true,
        command   => 'make',
        timeout   => 10000,
        path      => ['/usr/bin', '/usr/sbin',],
    }

  exec {'Make install ':
        cwd       => '/home/ModSecurity',
        logoutput => true,
        timeout   => 10000,
        command   => 'make install' ,
        path      => ['/usr/bin', '/usr/sbin',],
    }
  exec {'Clone ModSecurity connector  ':
        logoutput => true,
        timeout   => 10000,
        command   => 'git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git' ,
        path      => ['/usr/bin', '/usr/sbin',],
    }

  exec {'Download Nginx tar file  ':
        cwd       => '/home/',
        logoutput => true,
        timeout   => 10000,
        command   => 'wget http://nginx.org/download/nginx-1.13.1.tar.gz' ,
        path      => ['/usr/bin', '/usr/sbin',],
    }

  exec {'Extract ngix tar file  ':
        cwd       => '/home/',
        logoutput => true,
        timeout   => 10000,
        command   => 'tar zxvf nginx-1.13.1.tar.gz',
        path      => ['/usr/bin', '/usr/sbin',],
    }

exec {'Build Nginx  ':
        cwd       => '/home/nginx-1.13.1',
        logoutput => true,
        timeout   => 10000,
        command   => 'bash configure --with-compat --add-dynamic-module=../ModSecurity-nginx',
        path      => ['/usr/bin', '/usr/sbin',],
    }

exec {'Make Nginx Modules  ':
        cwd       => '/home/nginx-1.13.1',
        logoutput => true,
        timeout   => 10000,
        command   => 'make modules',
        path      => ['/usr/bin', '/usr/sbin',],
    }
}
