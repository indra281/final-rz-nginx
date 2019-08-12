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
}
