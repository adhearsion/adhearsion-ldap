require 'spec_helper'

describe AhnLDAP::Plugin do

  describe "while accessing the plugin configuration" do

    it "should retrieve a valid configuration instance" do
      Adhearsion.config.ahn_ldap.should be_instance_of Loquacious::Configuration
    end

    it "should configure properly the host" do
      Adhearsion.config[:ahn_ldap].host.should be_nil
    end

    it "should configure properly the port" do
      Adhearsion.config[:ahn_ldap].port.should == 389
    end

    it "should configure properly the base" do
      Adhearsion.config[:ahn_ldap].base.should be_empty
    end

    it "should configure properly the bind_dn" do
      Adhearsion.config[:ahn_ldap].bind_dn.should be_empty
    end

    it "should configure properly the password" do
      Adhearsion.config[:ahn_ldap].password.should be_empty
    end

    it "should configure properly the anonymous property" do
      Adhearsion.config[:ahn_ldap].allow_anonymous.should be_false
    end

    it "should configure properly the try_sasl property" do
      Adhearsion.config[:ahn_ldap].try_sasl.should be_false
    end

  end

  describe "while configuring a specific config value" do
    after do
      reset_ahn_ldap_config
    end

    it "ovewrites properly the host value" do
      Adhearsion.config[:ahn_ldap].host = "localhost"
      Adhearsion.config[:ahn_ldap].host.should == "localhost"
    end

    it "ovewrites properly the port value" do
      Adhearsion.config[:ahn_ldap].port = 489
      Adhearsion.config[:ahn_ldap].port.should == 489
    end

    it "ovewrites properly the base value" do
      Adhearsion.config[:ahn_ldap].base = "ou = value"
      Adhearsion.config[:ahn_ldap].base.should == "ou = value"
    end

    it "ovewrites properly the bind_dn value" do
      Adhearsion.config[:ahn_ldap].bind_dn = "uid = foo@bar"
      Adhearsion.config[:ahn_ldap].bind_dn.should == "uid = foo@bar"
    end
    
    it "ovewrites properly the password value" do
      Adhearsion.config[:ahn_ldap].password = "valid-credentials"
      Adhearsion.config[:ahn_ldap].password.should == "valid-credentials"
    end
    
    it "ovewrites properly the allow_anonymous value" do
      Adhearsion.config[:ahn_ldap].allow_anonymous = true
      Adhearsion.config[:ahn_ldap].allow_anonymous.should be_true
    end
  
    it "ovewrites properly the try_sasl value" do
      Adhearsion.config[:ahn_ldap].try_sasl = true
      Adhearsion.config[:ahn_ldap].try_sasl.should be_true
    end

  end

  describe "while loading plugins" do
    it "should load the init block and start the service" do
      AhnLDAP::Plugin::Service.should_receive(:start).once.and_return true
      Adhearsion::Plugin.load
    end
  end
end