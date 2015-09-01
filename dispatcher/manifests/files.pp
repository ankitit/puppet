class dispatcher::files (
$dir = '/etc/apache2/dispatcher',
){
file { '/tmp/dispatcher.any':
	content => template('dispatcher/dispatcher.any.erb'),
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0755',
}
exec { 'mv':
	path => ['/usr/bin', '/usr/sbin', '/bin'],
	command => "mv /tmp/dispatcher.any ${dir}",
	require => File['/tmp/dispatcher.any'],
}
exec { 'dispatcher_dir':
   path => ['/usr/bin', '/usr/sbin', '/bin'],
  command => "mkdir -p ${dir}",
  creates => "${dir}",
}
}
