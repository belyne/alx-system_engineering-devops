<<<<<<< HEAD
# This Puppet manifest installs and configures an Nginx server with a 301 redirect.

# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

# Define Nginx configuration
file { '/etc/nginx/sites-available/redirect_me':
  ensure  => 'file',
  content => 'location /redirect_me {
                  return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
              }',
}

# Create symbolic link for Nginx configuration
file { '/etc/nginx/sites-enabled/redirect_me':
  ensure => 'link',
  target => '/etc/nginx/sites-available/redirect_me',
}

# Ensure Nginx is listening on port 80
file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => 'server {
                  listen 80 default_server;
                  listen [::]:80 default_server;
                  root /var/www/html;
                  index index.html;
                  location / {
                      try_files $uri $uri/ =404;
                  }
              }',
}

# Restart Nginx service
service { 'nginx':
  ensure    => 'running',
  enable    => true,
  require   => [File['/etc/nginx/sites-available/default'], File['/etc/nginx/sites-available/redirect_me']],
  subscribe => [File['/etc/nginx/sites-available/default'], File['/etc/nginx/sites-available/redirect_me']],
}

# Ensure custom page exists
file { '/var/www/html/index.html':
  ensure  => 'file',
  content => 'Hello World!',
=======
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
>>>>>>> ee8ba18251e54b8bc657ff5eeeaca2f81429d679
}
