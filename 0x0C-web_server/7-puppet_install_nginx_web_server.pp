# 7-puppet_install_nginx_web_server.pp

# Define class for nginx installation and configuration
class nginx {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure  => running,
    require => Package['nginx'],
  }

  file { '/usr/share/nginx/html/index.html':
    ensure  => file,
    content => '<html><body>Hello World!</body></html>',
    require => Package['nginx'],
  }

  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => "server {
      listen 80 default_server;
      listen [::]:80 default_server;

      root /usr/share/nginx/html;
      index index.html;

      server_name _;

      location / {
          try_files $uri $uri/ =404;
      }
  }",
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}

include nginx

# Perform a 301 redirect
file { '/etc/nginx/sites-available/temp_redirect':
  ensure  => file,
  content => "server {
    listen 80;
    server_name _;
    return 301 https://belyne.tch;
  }",
  notify => Service['nginx'],
}

# Enable the temporary redirect
file { '/etc/nginx/sites-enabled/temp_redirect':
  ensure => link,
  target => '/etc/nginx/sites-available/temp_redirect',
}
