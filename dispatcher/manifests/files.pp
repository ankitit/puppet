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
file { '/tmp/vhosts.conf':
        content => template('dispatcher/vhosts.erb'),
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0755',
}
file { '/usr/lib/apache2/modules/dispatcher-apache2.so':
        content => template('dispatcher/dispatcher-apache2.4-4.1.10.so.erb'),
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0755',
}
exec { 'mv':
	path => ['/usr/bin', '/usr/sbin', '/bin'],
	command => "mkdir -p ${dir} && mv /tmp/dispatcher.any ${dir} && mv /tmp/vhosts.conf ${dir}",
	require => File['/tmp/dispatcher.any'],
}
#exec { 'dispatcher_dir':
#   path => ['/usr/bin', '/usr/sbin', '/bin'],
#  command => "mkdir -p ${dir}",
#  creates => "${dir}",
#}
}
