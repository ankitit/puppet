class dispatcher::files (
$dir = '/home/sysadmin',
){
file { '/tmp/dispatcher.any':
	content => template('dispatcher/dispatcher.any.erb'),
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0755',
}
#file { "${dir}/dispatcher.any":
#        ensure => file,
#        owner  => root,
#        group  => root,
#	 require
#    }
exec { 'mv':
	path => ['/usr/bin', '/usr/sbin', '/bin'],
	command => "mv /tmp/dispatcher.any ${dir}",
	require => File['/tmp/dispatcher.any'],
}
}
