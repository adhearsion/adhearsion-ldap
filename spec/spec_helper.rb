require 'adhearsion/ldap'

def reset_adhearsion_ldap_config
  Adhearsion.config[:adhearsion_ldap].host            = nil
  Adhearsion.config[:adhearsion_ldap].port            = 389
  Adhearsion.config[:adhearsion_ldap].base            = ""
  Adhearsion.config[:adhearsion_ldap].bind_dn         = ""
  Adhearsion.config[:adhearsion_ldap].password        = ""
  Adhearsion.config[:adhearsion_ldap].allow_anonymous = false
  Adhearsion.config[:adhearsion_ldap].try_sasl        = false
end
