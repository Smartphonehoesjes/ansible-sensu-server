[![Build Status](https://travis-ci.org/030/ansible-sensu-server.svg?branch=master)](https://travis-ci.org/030/ansible-sensu-server)

ansible-sensu-server
====================

Installs and configures a sensu-server, sensu-api, redis, rabbitmq, uchiwa, graphite and carbon. The sensu-client, including checks, e.g. CPU, memory will be configured and installed by another role. In summary, this role creates a working sensu system.

Requirements
------------

All required services are configured and installed by this role.

Role Variables
--------------

* apis

```
sensu_server_apis:
  hello: world
  host: localhost
```

* create uchiwa users

```
sensu_server_uchiwa_users:
  - name: helloadmin
    password: pw
    accessToken: ""
    readonly: false
  - name: helloguest
    password: pw2
    accessToken: ""
    readonly: true
```

* sensu host

```
sensu_server_host: localhost
```

* multiple mailer handlers

If a distinction need to be made between notifications from production or other systems.

```
sensu_server_mailer: true
```

and

```
sensu_server_mail_to:
  - e
  - f
  - g
sensu_server_subscriptions:
  - name: x
    mail_to:
      - a
      - b
  - name: y
    mail_to:
      - c
      - d
```

Dependencies
------------

* 030.sensu-install
* 030.sensu-client
* geerlingguy.ntp
* geerlingguy.redis
* Stouts.rabbitmq

Example Playbook
----------------

```
- hosts: servers
  roles:
    - { role: 030.sensu-server }
```

* secure uchiwa

```
- hosts: servers
  vars:
    sensu_server_uchiwa_ssl: true
    sensu_server_uchiwa_port: 8443
  roles:
    - { role: 030.sensu-server }
```

License
-------

MIT

Additional testing
------------------

```
./tests/template.sh
```

Author Information
------------------

http://stackexchange.com/users/3302040/030
