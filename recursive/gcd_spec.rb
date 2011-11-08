require './gcd'

describe "gcd" do
  it { gcd(8, 12).should == 4 }

  it { gcd(150, 45).should == 15 }
end
