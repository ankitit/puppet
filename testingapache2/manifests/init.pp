# == Class: testingapache2
#
# Full description of class testingapache2 here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'testingapache2':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class testingapache2 (
$port = '',
#$DocumentRoot = '/var/www/html/testing',
$documentRoot = '',
){
file { '/etc/apache2/ports.conf':
	notify  => Service["apache2"],
	content => template('testingapache2/ports.conf.erb'),
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0755',
}
package { 'apache2':
	ensure => 'present',
	require => File['/etc/apache2/ports.conf'],
}
service {'apache2':
	ensure => 'running',
        enable => 'true',
}
}
