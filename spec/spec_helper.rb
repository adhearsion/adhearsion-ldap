require 'ahn_ldap'

def reset_ahn_ldap_config
  Adhearsion.config[:ahn_ldap].host            = nil
  Adhearsion.config[:ahn_ldap].port            = 389
  Adhearsion.config[:ahn_ldap].base            = ""
  Adhearsion.config[:ahn_ldap].bind_dn         = ""
  Adhearsion.config[:ahn_ldap].password        = ""
  Adhearsion.config[:ahn_ldap].allow_anonymous = false
  Adhearsion.config[:ahn_ldap].try_sasl        = false
end