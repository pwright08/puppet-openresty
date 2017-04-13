
class openresty::package inherits openresty::params {


  package { 'openresty':
    ensure => present,
  }


  yumrepo { 'OpenRestyRepository':
    ensure   => 'present',
    baseurl  => 'https://copr-be.cloud.fedoraproject.org/results/openresty/openresty/epel-$releasever-$basearch/',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'https://copr-be.cloud.fedoraproject.org/results/openresty/openresty/pubkey.gpg'
  }

}
