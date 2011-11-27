ahn-ldap
========

ahn-ldap is an Adhearsion Plugin providing LDAP connectivity.

Features
--------

* FIXME (list of features and unsolved problems)

Requirements
------------

* Adhearsion 2.0+

Install
-------

Add `ahn-ldap` to your Adhearsion app's Gemfile.

Configuration
-------------

In your Adhearsion app configuration file, add the following values:

```ruby
Adhearsion.config do |config|
  config.ahn_ldap.host    = "valid-host"
  config.ahn_ldap.port    = "valid-port".to_i # 389 by default
  config.ahn_ldap.base    = "valid-ldap-base"
  config.ahn_ldap.bind_dn = "valid-ldap-binding"
  config.ahn_ldap.allallow_anonymous = true # false
  config.ahn_ldap.try_sasl           = true # false
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

Check [License file](https://github.com/adhearsion/ahn-ldap/blob/master/LICENSE)