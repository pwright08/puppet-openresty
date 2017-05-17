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

  $openresty_dirs = [ "${llc_nginx_base_dir}", "${llc_nginx_base_dir}/conf/", 
    "${llc_nginx_base_dir}/conf/modules", "${llc_nginx_base_dir}/conf/conf.d", "${llc_nginx_base_dir}/conf/sites", "/var/log/nginx/"]

  file { $openresty_dirs:
    ensure => 'directory',
    #owner  => 'root',
    #group  => 'wheel',
    mode   => '0755',
  }

}
