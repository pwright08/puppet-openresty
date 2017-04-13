class openresty::params {
	$openresty_url        = hiera('openresty_url')
	$luasocket_url        = hiera('luasocket_url')
	$https                = true
	$user                 = "nobody nogroup"
	$worker_processes     = "1"
	$worker_connections   = "1024"
	$worker_rlimit        = "8192"
	$keepalive_timeout    = "15"
	$port                 = "80"
	$gzip                 = undef
	$client_max_body_size = "10M"
	$nginx_base_dir       = hiera('nginx_base_dir')

}
