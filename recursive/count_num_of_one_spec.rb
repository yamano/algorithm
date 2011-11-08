require './count_num_of_one'

describe Integer do
  [ [ 111561171, 6 ],
    [ 173181,    3 ],
    [ 0,         0 ],
    [ -1,        1 ],
    [ -173181,   3 ],
  ].each do |input, output|
    it "#{input}.count_num_of_one is #{output}" do
      input.count_num_of_one.should == output
    end
  end
end
