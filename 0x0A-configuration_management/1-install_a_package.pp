# 1-install_a_package.pp
# Description: Install Flask from pip3.

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
