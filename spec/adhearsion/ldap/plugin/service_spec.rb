require 'spec_helper'

describe Adhearsion::LDAP::Plugin::Service do

  describe "while initializing" do
    after do
      reset_adhearsion_ldap_config
    end

    it "should raise an exception when no host has been configured" do
      lambda { Adhearsion::Plugin.init_plugins }.should raise_error "Must supply a host argument to the LDAP configuration"
    end

    it "should raise an exception when an invalid port has been configured" do
      Adhearsion.config[:adhearsion_ldap].host = "localhost"
      Adhearsion.config[:adhearsion_ldap].port = "389"
      lambda { Adhearsion::Plugin.init_plugins }.should raise_error "Must supply a valid port to the LDAP configuration"
    end
  end

  describe "when starting the LDAP connection" do
    before do
      Adhearsion.config[:adhearsion_ldap].host = "localhost"
      Adhearsion::LDAP::Plugin::Service.any_instance.should_receive(:require_models).and_return true
    end

    after do
      reset_adhearsion_ldap_config
    end

    it "should call Connection.start method with the valid parameters" do
      Adhearsion::LDAP::Plugin::Service.any_instance.should_receive(:establish_connection).with("localhost", 389, "", "", "", false, false).and_return true
      Adhearsion::Plugin.init_plugins
    end

  end

end
