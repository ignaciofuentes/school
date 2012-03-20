require 'spec_helper'

describe Student do

  it "must have first name" do
    s = Student.new
    s.should_not be_valid
    s.errors[:first_name].should_not be_blank
  end
end
