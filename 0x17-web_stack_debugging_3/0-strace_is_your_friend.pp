# web stack debugging using puppet

$file_to_edit = '/var/www/html/wp-settings.php'

#change the word "phpp" with "php"

exec { 'typing_error':
  command => "sed -i 's/phpp/php/g' ${file_to_edit}",
  path    => ['/bin','/usr/bin']
}
