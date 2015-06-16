adhearsion-ldap
===============

adhearsion-ldap is an Adhearsion Plugin providing LDAP connectivity based on [ActiveLdap](https://github.com/activeldap/activeldap).

Features
--------

* Allows mapping LDAP objects into Adhearsion using ActiveRecord-like syntax.

Requirements
------------

* Adhearsion 2.x
* ruby-ldap or net-ldap **Must be installed manually**

adhearsion-ldap uses ActiveLdap internally, which on CRuby can use either ruby-ldap or net-ldap. Since Gemfiles don't allow specifying dependencies like that, must manually install one or the other.  See instructions below.

Note that the LDAP gem you choose may require development packages for the header files. You can get them like this:

```bash
# RHEL & CentOS
$ sudo yum install openldap-devel cyrus-sasl-devel

# Debian & Ubuntu
$ sudo apt-get install libldap2-dev libsasl2-dev
```

Install
-------

Add this to your Adhearsion app's Gemfile.

```ruby
gem 'adhearsion', '~> 2.0'
gem 'ruby-ldap', platform: 'ruby'
```

Configuration
-------------

In your Adhearsion app configuration file, add the following values:

```ruby
Adhearsion.config do |config|
  config.adhearsion_ldap.host    = "ldap-server.example.com" # Defaults to port 389
  config.adhearsion_ldap.base    = "dc=example,dc=com"
  config.adhearsion_ldap.bind_dn = "uid=Manager,dc=example,dc=com"
  config.adhearsion_ldap.password = "secret"
end
```

As always, use `rake config:show` to see the complete list of options.

Example
-------

```ruby
class Extension < ActiveLdap::Base
  ldap_mapping :dn_attribute => 'uid', :prefix => 'ou=Extensions', :classes => ['top', 'AsteriskUser', 'AsteriskVoiceMail']
end
```

Links
-----
* [Source](https://github.com/adhearsion/ahn-ldap)
* [Documentation](http://rdoc.info/github/adhearsion/ahn-ldap/master/frames)
* [Bug Tracker](https://github.com/adhearsion/ahn-ldap/issues)

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Check [License file](https://github.com/adhearsion/adhearsion-ldap/blob/master/LICENSE)
