require 'spec_helper'

describe Adhearsion::LDAP::Plugin do

  describe "while accessing the plugin configuration" do

    it "should retrieve a valid configuration instance" do
      Adhearsion.config.adhearsion_ldap.should be_instance_of Loquacious::Configuration
    end

    it "should configure properly the host" do
      Adhearsion.config[:adhearsion_ldap].host.should be_nil
    end

    it "should configure properly the port" do
      Adhearsion.config[:adhearsion_ldap].port.should == 389
    end

    it "should configure properly the base" do
      Adhearsion.config[:adhearsion_ldap].base.should be_empty
    end

    it "should configure properly the bind_dn" do
      Adhearsion.config[:adhearsion_ldap].bind_dn.should be_empty
    end

    it "should configure properly the password" do
      Adhearsion.config[:adhearsion_ldap].password.should be_empty
    end

    it "should configure properly the anonymous property" do
      Adhearsion.config[:adhearsion_ldap].allow_anonymous.should be_false
    end

    it "should configure properly the try_sasl property" do
      Adhearsion.config[:adhearsion_ldap].try_sasl.should be_false
    end

  end

  describe "while configuring a specific config value" do
    after do
      reset_adhearsion_ldap_config
    end

    it "ovewrites properly the host value" do
      Adhearsion.config[:adhearsion_ldap].host = "localhost"
      Adhearsion.config[:adhearsion_ldap].host.should == "localhost"
    end

    it "ovewrites properly the port value" do
      Adhearsion.config[:adhearsion_ldap].port = 489
      Adhearsion.config[:adhearsion_ldap].port.should == 489
    end

    it "ovewrites properly the base value" do
      Adhearsion.config[:adhearsion_ldap].base = "ou = value"
      Adhearsion.config[:adhearsion_ldap].base.should == "ou = value"
    end

    it "ovewrites properly the bind_dn value" do
      Adhearsion.config[:adhearsion_ldap].bind_dn = "uid = foo@bar"
      Adhearsion.config[:adhearsion_ldap].bind_dn.should == "uid = foo@bar"
    end

    it "ovewrites properly the password value" do
      Adhearsion.config[:adhearsion_ldap].password = "valid-credentials"
      Adhearsion.config[:adhearsion_ldap].password.should == "valid-credentials"
    end

    it "ovewrites properly the allow_anonymous value" do
      Adhearsion.config[:adhearsion_ldap].allow_anonymous = true
      Adhearsion.config[:adhearsion_ldap].allow_anonymous.should be_true
    end

    it "ovewrites properly the try_sasl value" do
      Adhearsion.config[:adhearsion_ldap].try_sasl = true
      Adhearsion.config[:adhearsion_ldap].try_sasl.should be_true
    end

  end

  describe "while loading plugins" do
    it "should load the init block and start the service" do
      Adhearsion::LDAP::Plugin::Service.should_receive(:start).once.and_return true
      Adhearsion::Plugin.init_plugins
    end
  end
end