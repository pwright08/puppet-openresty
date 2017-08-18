class openresty::params {
	$openresty_version    = hiera('llc_openresty_version')
	$https                = true
	$user                 = "nobody nogroup"
	$worker_processes     = "1"
	$worker_connections   = "1024"
	$worker_rlimit        = "8192"
	$keepalive_timeout    = "15"
	$port                 = hiera('llc_openresty_listen_port')
	$gzip                 = undef
	$client_max_body_size = "10M"
	$nginx_base_dir       = hiera('llc_nginx_base_dir')
	$google_analytics_id  = hiera('google_analytics_id', undef)
	$manage_repo          = hiera('llc_openresty_manage_repo', true)
	$nginx_resolver       = hiera('nginx_resolver', undef)
}
