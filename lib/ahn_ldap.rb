require 'adhearsion'
require 'active_support/dependencies/autoload'
require 'ahn_ldap/version'
require 'adhearsion/ldap'

class AhnLdapPlugin < Adhearsion::Plugin
  init :ldap do
    Ldap.start if AHN_CONFIG.ldap_enabled?
  end
end
