

Getting Started
===============

Execute Docker Compose with the following command:
```shell
docker-compose up --build
```

After that, an error will be raised if you try to add a puppet agent:
> puppet-agent_1    | Error: Could not request certificate: Failed to open TCP connection to puppet:8140 (Host is unreachable - connect(2) for "puppet" port 8140)

BTW, even with this error, it's possible to acces the Puppet Board on the
following link: http://127.0.0.1:80/


To fix the problem, we need to execute the following steps:

Access puppet-server container and check if the hostname is defined as `puppet`.
```shell
ricardo@ricardo-lohmann:~/Projects/puppet (master) $ docker-compose exec puppet-server /bin/bash
root@puppet:/# hostname
puppet
```

Modify the hosts' file(/puppet/etc/hosts) to add puppet agents.
```shell
root@puppet:/# vi /etc/hosts
root@puppet:/# cat /etc/hosts
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
172.23.0.3	puppet
172.23.0.4	puppet-agent
```

After that, it's possible to add a new puppet agent to the network
```shell
docker run --net puppet_default puppet/puppet-agent-alpine
```