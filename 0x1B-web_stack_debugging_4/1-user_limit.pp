# 1-user_limit.pp
# Puppet manifest to resolve "Too many open files" issue for the holberton user

# Increase hard file limit for user holberton
augeas { 'increase-hard-file-limit-for-holberton-user':
  lens    => 'Limits.lns',
  incl    => '/etc/security/limits.conf',
  changes => [
    'set holberton hard nofile 50000',
  ],
}

# Increase soft file limit for user holberton
augeas { 'increase-soft-file-limit-for-holberton-user':
  lens    => 'Limits.lns',
  incl    => '/etc/security/limits.conf',
  changes => [
    'set holberton soft nofile 50000',
  ],
}
