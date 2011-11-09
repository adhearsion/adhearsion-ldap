# Getting started

*ahn-ldap* is an Adhearsion plugin that allows AHN configuration via LDAP.

# Install

```
gem install ahn-ldap
```

If you include the dependency in your application Gemfile, that should be enough as Adhearsion loads the Bundler environment.

If you use a gemspec or have just added it to your gems folder, include the line below in the script/ahn file:

```ruby
require 'adhearsion'
require 'adhearsion/cli_commands'
require 'ahn-ldap'
```

# Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
* If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

# Copyright

Check [License file](https://github.com/adhearsion/ahn-ldap/blob/master/LICENSE)
