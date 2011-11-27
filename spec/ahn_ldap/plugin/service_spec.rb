require 'spec_helper'

describe AhnLDAP::Plugin::Service do

  describe "while initializing" do
    after do
      reset_ahn_ldap_config
    end
    
    it "should raise an exception when no host has been configured" do
      lambda {Adhearsion::Plugin.load}.should raise_error "Must supply a host argument to the LDAP configuration"
    end

    it "should raise an exception when an invalid port has been configured" do
      Adhearsion.config[:ahn_ldap].host = "localhost"
      Adhearsion.config[:ahn_ldap].port = "389"
      lambda {Adhearsion::Plugin.load}.should raise_error "Must supply a valid port to the LDAP configuration"
    end
  end

  describe "when starting the LDAP connection" do    
    before do
      Adhearsion.config[:ahn_ldap].host = "localhost"
    end

    after do
      reset_ahn_ldap_config
    end
    
    it "should call Connection.start method with the valid parameters" do
      AhnLDAP::Plugin::Service.should_receive(:establish_connection).with("localhost", 389, "", "", "", false, false).and_return true
      Adhearsion.config.should_receive(:files_from_setting).with("paths", "models").and_return []
      Adhearsion::Plugin.load
    end

  end

end
