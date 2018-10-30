class base {

  file { '/etc/motd':
    content => "${::fqdn}\n Managed by puppet ${::puppetversion}\n"
  }

  class { 'puppetdb':
    listen_address => 'localhost'
  }

}

node default {
  include base
}
