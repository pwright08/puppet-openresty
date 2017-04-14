class openresty::params {
	$openresty_version    = hiera('openresty_version')
	$https                = true
	$user                 = "nobody nogroup"
	$worker_processes     = "1"
	$worker_connections   = "1024"
	$worker_rlimit        = "8192"
	$keepalive_timeout    = "15"
	$port                 = hiera('openresty_listen_port')
	$gzip                 = undef
	$client_max_body_size = "10M"
	$nginx_base_dir       = hiera('nginx_base_dir')

}
