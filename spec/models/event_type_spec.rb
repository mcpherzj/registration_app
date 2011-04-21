require 'spec_helper'

describe EventType do

  before(:each) do
    @attr = { :name => "Example Event Type" }
  end

  it "should create a new instance given valid attributes" do
    EventType.create!(@attr)
  end
	
  it "should require a name that is not an empty string" do
    empty_name = "" 
    empty_name_et = EventType.new(@attr.merge(:name => empty_name))
    empty_name_et.should_not be_valid
  end

  it "should require a name that is not nil" do
    nil_name = nil 
    nil_name_et = EventType.new(@attr.merge(:name => nil_name))
    nil_name_et.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 101
    long_name_et = EventType.new(@attr.merge(:name => long_name))
    long_name_et.should_not be_valid
  end

  it "should reject duplicate names" do
    # Put a user with given name into the database.
	EventType.create!(@attr)
	eventType_with_duplicate_email = EventType.new(@attr)
	eventType_with_duplicate_email.should_not be_valid
  end
end
