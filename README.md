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

Dependencies
------------

* 030.sensu-install
* 030.sensu-client
* geerlingguy.ntp

Example Playbook
----------------

```
- hosts: servers
  roles:
    - { role: 030.sensu-server }
```

License
-------

MIT

Author Information
------------------

http://stackexchange.com/users/3302040/030
