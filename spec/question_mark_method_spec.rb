require 'spec_helper'

describe QuestionMarkMethod do
  let(:alice) { Member.new("alice", true) }
  let(:bob) { Member.new("bob", false) }

  context "end with a question mark" do
    it "returns the original method result of false" do
      bob.charged?.should == false
    end

    it "returns the original method result of true" do
      alice.name?.should == true
    end
  end

  context "not end with a question mark" do
    it "raise an NoMethodError" do
      lambda { alice.is_charged }.should raise_error(NoMethodError)
    end
  end

  context "when added macros" do
    before do
      Member.class_eval do
        add_question_mark_methods is_charged?: :charged, has_a_name?: :name
      end
    end

    it "returns true when has a name" do
      alice.has_a_name?.should == true
    end

    it "returns true when has beed charged" do
      alice.is_charged?.should == true
    end

    it "raises a NoMethodError" do
      lambda {alice.has_been_charged }.should raise_error(NoMethodError)
    end
  end
end

class Member
  include QuestionMarkMethod

  def initialize(not_a_boolean_value, boolean_value)
    @name = not_a_boolean_value
    @charged = boolean_value
  end
end
