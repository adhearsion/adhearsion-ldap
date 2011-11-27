require "adhearsion"
require "active_support/dependencies/autoload"

begin
  require 'active_ldap'
rescue LoadError
  logger.fatal "LDAP support requires the \"activeldap\" gem."
  # Silence the abort so we don't get an ugly backtrace
  abort ""
end

require "ahn_ldap/version"
require "ahn_ldap/plugin"

module AhnLDAP

end
