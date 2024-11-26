# 0-the_sky_is_the_limit_not.pp
# This Puppet manifest configures Nginx for high performance under load.

file { '/etc/nginx/nginx.conf':
  ensure  => file,
  content => template('web_stack_debugging_4/nginx.conf.erb'),
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  provider  => 'systemd',
}
