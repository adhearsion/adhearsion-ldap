require 'adhearsion'
require 'active_support/dependencies/autoload'
require 'ahn_ldap/version'
require 'adhearsion/ldap'

class AhnLdap < Adhearsion::Plugin
  init :ahn_ldap do
    init :ldap do
      #... if AHN_CONFIG.ldap_enabled?
    end
  end
end
