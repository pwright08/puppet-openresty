
class openresty::package inherits openresty::params {

  if $manage_repo { 
    yumrepo { 'OpenRestyRepository':
      ensure   => 'present',
      descr    => 'OpenResty Repository',
      baseurl  => 'https://copr-be.cloud.fedoraproject.org/results/openresty/openresty/epel-$releasever-$basearch/',
      enabled  => 1,
      gpgcheck => 1,
      gpgkey   => 'https://copr-be.cloud.fedoraproject.org/results/openresty/openresty/pubkey.gpg',
      before   =>  Package[openresty]
    }
  }

  package { 'openresty':
    ensure  => "${openresty_version}",
  }

}
