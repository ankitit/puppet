#class motd {
#       $motdfile = "/etc/motd.tail"

#       file { '/tmp/sharad':
#               ensure => present,
#		owner => root,
#               group => root,
#               mode => 644,
#       }
#class motd_test::ntp {
exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}

package { 'ntp':
   require => Exec['apt-update'],
   ensure => installed,
}
service { 'ntp':
    ensure     => running,
    enable     => true,
    require => Package['ntp'],
}
#}
