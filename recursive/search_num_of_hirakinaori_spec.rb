require './search_num_of_hirakinaori'

describe "search_num_of_hirakinaori" do

  [ [ [ 3, 3, 4, 5 ], 3435],
    [ [ 1          ], 1   ],
    [ [ 1, 2, 3, 4 ], nil ],
    [ [ 1, 2, 3    ], nil ],
  ].each do |args, answer|
    it "search_num_of_hirakinaori(*#{args}) is #{answer}" do
      search_num_of_hirakinaori(args).should == answer
    end
  end
end

=begin
describe "make_combination" do
  it "" do
    make_numbers(2).size == 55
  end
end
=end

describe "calc_hirakinaori" do
  it { calc_hirakinaori([ 0, 0, 0, 0, 0, 0, 3, 3, 4, 5 ]).should == 3435 }
  it { calc_hirakinaori([ 0, 0, 0, 0, 0, 0, 0, 6, 7, 8 ]).should == 17647415 }
end

describe "match_numbers?" do
  it { match_numbers?(0, [ 0 ]).should be_true }
  it { match_numbers?(1, [ 0, 1 ]).should be_true }
  it { match_numbers?(3435, [ 0, 0, 0, 0, 0, 0, 3, 3, 4, 5 ]).should be_true }
  it { match_numbers?(17647415, [ 0, 0, 0, 0, 0, 0, 0, 6, 7, 8 ]).should be_false }
end
