class openresty::site {

define site_define (
	$enable_auto_index		 = hiera('nginx::enable_auto_index', 'false'),
	$nginx_base_dir			   = hiera('nginx_base_dir'),
	$ensure					       = 'enable',
	$listen_ip				     = '*',
	$listen_port			     = hiera('openresty_listen_port'),
	$server_name			     = [$name],
	$www_root				       = undef,
	$log_access				     = "/var/log/nginx/${name}access.log",
	$log_error				     = "/var/log/nginx/${name}error.log",
	$custom_access_log		 = undef,
	$rewrite_http_to_https = undef,
	$nginx_status			     = undef,
	$nginx_status_allow		 = ["127.0.0.1"],
	$locations,
) {


	file {"site_${name}.conf":
		path    => "${nginx_base_dir}/conf/sites/site_${name}.conf",
		ensure  => present,
		purge   => true,
		content => template('openresty/site.conf.erb'),
		notify  => Service['openresty'],
	}
}

	site_define {"llc_beta_01":
		ensure      => enable,
		server_name => ["llc_beta_01"],
		locations   => hiera('llc_site_locations_01')
	}

}
