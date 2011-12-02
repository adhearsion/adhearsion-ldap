module Adhearsion
  module LDAP
    class Plugin
      class Service

        ##
        # Start LDAP connection
        def start
          raise "Must supply a host argument to the LDAP configuration" if (config.host.nil? || config.host.empty?)
          raise "Must supply a valid port to the LDAP configuration" unless config.port.is_a? Integer

          require_models
          establish_connection  config.host,
                                config.port,
                                config.base,
                                config.bind_dn,
                                config.password,
                                config.allow_anonymous,
                                config.try_sasl

          Events.register_callback(:shutdown) { stop }
        end

        # TODO: It appears that ActiveLdap does not have a connection validation
        # or reconnection routine.
        #def create_call_hook_for_connection_cleanup
        #  Events.register_callback([:asterisk, :before_call]) do
        #    ActiveLdap::Base.verify_active_connections!
        #  end
        #end

        ##
        # Release LDAP connection
        def stop
          ActiveLdap::Base.remove_connection
        end

        private

        def require_models
          path = File.join(Adhearsion.config.platform.root, Adhearsion.config.adhearsion_ldap.models)
          Dir.open(Adhearsion.config.adhearsion_ldap.models).each do |model|
            require File.join(path, model) if model =~ /\.rb$/
          end
        end

        ##
        # Open LDAP connection
        def establish_connection host, port, base, bind_dn, password, allow_anonymous, try_sasl
          ActiveLdap::Base.setup_connection :host            => host,
                                            :port            => port,
                                            :base            => base,
                                            :logger          => logger,
                                            :bind_dn         => bind_dn,
                                            :password        => password,
                                            :allow_anonymous => allow_anonymous,
                                            :try_sasl        => try_sasl
        end

        def config
          @config ||= Adhearsion.config[:adhearsion_ldap]
        end
      end # Service
    end # Plugin
  end # LDAP
end # Adhearsion
