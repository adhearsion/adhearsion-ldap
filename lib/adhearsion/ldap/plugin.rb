module Adhearsion
  module LDAP

    ##
    # Adhearsion Plugin that defines the LDAP configuration options
    # and includes a hook to start the LDAP service in Adhearsion initialization process
    class Plugin < Adhearsion::Plugin
      extend ActiveSupport::Autoload

      autoload :Service

      # Default configuration for LDAP connection.
      # Configure an LDAP connection using ActiveLdap.  See ActiveLdap::Base.establish_connect
      # for further information about the appropriate settings here.
      config :adhearsion_ldap do
        host            nil  , :desc => "LDAP server host"
        port            389  , :desc => "LDAP server port"
        base            ""   , :desc => <<-__
          LDAP tree that must be used in the connection
        __
        bind_dn         ""   , :desc => <<-__
          Specific domain name that identifies the user
        __
        password        ""   , :desc => "Password credentials"
        allow_anonymous false, :desc => "valid values: true | false (default)"
        try_sasl        false, :desc => "valid values: true | false (default)"
      end

      # Include the LDAP service in plugins initialization process
      init :adhearsion_ldap do
        Service.start
      end

    end

  end
end
