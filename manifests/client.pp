#
class mysql::client (
  $bindings_enable = false,
) inherits mysql::globals {

  include '::mysql::client::install'

  anchor { 'mysql::client::begin': }
  anchor { 'mysql::client::end': }

  Anchor['mysql::client::begin'] ->
  Class['mysql::client::install'] ->
  Anchor['mysql::client::end']

  if $bindings_enable {
    class { 'mysql::bindings':
      java_enable   => true,
      perl_enable   => true,
      php_enable    => true,
      python_enable => true,
      ruby_enable   => true,
    }
  }

}
