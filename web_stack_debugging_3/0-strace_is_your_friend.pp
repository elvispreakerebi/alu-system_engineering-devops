# This Puppet manifest fixes the WordPress Apache server issue

package { 'php-mysql':
  ensure => installed,
}

exec { 'fix-permissions':
  command => 'chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html',
  path    => ['/bin', '/usr/bin'],
}

service { 'apache2':
  ensure    => running,
  enable    => true,
  subscribe => Package['php-mysql'],
}
