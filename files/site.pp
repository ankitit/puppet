#class {'mongo::master':
#port => '27019',
#replSet => 'sdrepsetcommon',
#master => 'master',
#master_port => '27019',
#public_ip => '172.31.8.134',
#test => 'puppetagentmongo.example.com',
##testport => '27017',
#}
#class {'mongo::slave':
#port => '27019',
#replSet => 'sdrepsetcommon',
#master => 'slave',
#master_port => '27017',
#public_ip => '172.31.8.134',
#
#}
class { '::mongodb::globals': manage_package_repo => true }->
class {'::mongodb::server':
  port    => 27017,
  verbose => true,
}
