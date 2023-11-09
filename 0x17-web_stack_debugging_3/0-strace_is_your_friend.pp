# Define variables
$file_to_edit = '/var/www/html/wp-settings.php'
$line_to_replace = 'phpp'
$replacement_line = 'php'

# Ensure the file exists
file { $file_to_edit:
  ensure => present,
}

# Use Augeas to replace the specified line
augeas { 'replace_line':
  context => "/files${file_to_edit}",
  changes => "set *[contains(text(), '${line_to_replace}')][last()] '${replacement_line}'",
  onlyif  => "match *[contains(text(), '${line_to_replace}')] size > 0",
  require => File[$file_to_edit],
}
