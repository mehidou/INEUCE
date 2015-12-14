user { "vagrant":
  groups => ['www-data', 'adm'],
}

file {'/home/vagrant/.bashrc':
  source => '/vagrant/vagrant/dot_files/bashrc',
  owner => 'vagrant',
}

file {'/home/vagrant/.bash_aliases':
  source => '/vagrant/vagrant/dot_files/bash_aliases',
  owner => 'vagrant',
}

file { '/home/vagrant/dev':
  ensure => 'link',
  target => '/vagrant',
  force => true,
}

file { '/home/vagrant/modules':
  ensure => 'link',
  target => '/vagrant/modules',
  force => true,
}

file { '/home/vagrant/themes':
  ensure => 'link',
  target => '/vagrant/themes',
  force => true,
}

file { '/home/vagrant/www':
  ensure => 'link',
  target => '/vagrant/www',
  force => true,
}

file { '/home/vagrant/translations':
  ensure => 'link',
  target => '/vagrant/translations',
  force => true,
}

file { '/home/vagrant/bin':
  ensure => 'link',
  target => '/vagrant/bin',
  force => true,
}

$packages = [
  'less',
  'dos2unix',
  'emacs23-nox',
  'emacs-jabber',
  'php-elisp',
  'curl',
  'colordiff',
  'bzip2',
  'unzip',
  'lynx',
  'screen',
  'git',
  'subversion',
  'default-jre'
]

package { $packages:
  ensure  => 'installed',
}

class { '::mysql::server':
  root_password    => 'vagrant',
  override_options => {
    'mysqld' => {
      'max_connections' => '100000',
      'wait_timeout' => '31536000',
      'max_allowed_packet' => 1073741824,
      'default-storage-engine' => 'MyISAM',
      'skip-innodb' => '',
    }
  }
}

mysql::db { 'vagrant':
  user     => 'vagrant',
  password => 'vagrant',
  host     => 'localhost',
}

class { 'apache':
  mpm_module   => 'prefork',
  user         => 'vagrant',
  group        => 'vagrant',
  manage_user  => false,
  manage_group => false
}

class {'apache::mod::php': }

apache::mod { 'rewrite': }

apache::vhost { 'vagrant':
  priority      => '1',
  port          => '80',
  serveraliases => [],
  default_vhost => true,
  docroot       => '/home/vagrant/www',
  directories   => [ {
    path => '/home/vagrant/www/',
    allow => 'from all',
    allow_override => ['All'],
  } ],
}

file { '/var/www':
  ensure => 'link',
  target => '/vagrant/www',
  force => true,
}

class { 'php': }

php::ini { 'php':
  value => [
    'date.timezone = "Europe/Brussels"',
    'display_errors = On',
    'display_startup_errors = On',
    'track_errors = On',
    'error_reporting = E_ALL',
    'memory_limit = 2048M',
    'post_max_size = 50M',
    'upload_max_filesize = 50M',
  ],
}

$phpModules = [ 'gd', 'imagick', 'xdebug', 'curl', 'mysql', 'cli', 'intl', 'mcrypt', 'memcache']

php::module { $phpModules: }
