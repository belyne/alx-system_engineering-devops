# 2-execute_a_command.pp
# Description: Kill a process named killmenow using exec resource.

exec { 'killmenow':
  command     => 'pkill killmenow',
  path        => '/usr/bin:/bin',
  subscribe   => File['/tmp/killmenow'], # Ensure this file exists before executing the command
  refreshonly => true,
}
