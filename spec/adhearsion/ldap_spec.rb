require 'spec_helper'

describe Adhearsion::LDAP do

  subject { Adhearsion::LDAP }

  it "should be a module" do
    subject.should be_kind_of Module
  end

end
