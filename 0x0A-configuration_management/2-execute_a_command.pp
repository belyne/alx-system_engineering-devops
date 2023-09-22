# File: 2-execute_a_command.pp
# Description: Kill a process named killmenow using exec resource.

file { '/tmp/killmenow':
  ensure  => file,
  content => "This file ensures the killmenow process can be terminated.",
}

exec { 'killmenow':
  command     => 'pkill killmenow',
  path        => '/usr/bin:/bin',
  refreshonly => true,
  subscribe   => File['/tmp/killmenow'],
}
