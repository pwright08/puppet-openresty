class openresty (

) inherits openresty::params {
  class { 'openresty::package': }
  class { 'openresty::config':
   require => Class['openresty::package'],
  }
 class { 'openresty::service':
   require => [ Class['openresty::config'], Class['openresty::package'] ],
 }
  class { 'openresty::site': }

  $openresty_dirs = [ "${nginx_base_dir}", "${nginx_base_dir}/conf/", 
    "${nginx_base_dir}/conf/modules", "${nginx_base_dir}/conf/conf.d", "${nginx_base_dir}/conf/sites"]

  file { $openresty_dirs:
    ensure => 'directory',
    #owner  => 'root',
    #group  => 'wheel',
    mode   => '0755',
  }

}
