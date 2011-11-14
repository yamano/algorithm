require './pattern_match_spec'

describe Pattern_match do
  it'' do
    contents = "(abcde)"
    Pattern_match.new.pattern_match(contents).should == true
  end
  
end
