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
}
