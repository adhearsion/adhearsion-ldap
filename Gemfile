source "http://rubygems.org"

gem 'adhearsion', :git => 'git://github.com/adhearsion/adhearsion.git', :branch => :develop

# Specify your gem's dependencies in ahn-asterisk.gemspec
gemspec

source :rubygems

group :development do
  gem 'guard'
  gem 'guard-rspec'
  if RUBY_PLATFORM =~ /darwin/
    #gem 'growl_notify'
    gem 'growl'
    gem 'rb-fsevent'
  else
    gem 'rb-inotify', :require => false
    #gem 'rb-fchange', :require => false
  end
end

