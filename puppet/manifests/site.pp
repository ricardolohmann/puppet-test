class base {

  file { '/etc/motd':
    content => '${::fqdn}\n Managed by puppet ${::puppetversion}\n'
  }

}

node default {
  include base
  include scrappy_coco
}
