require './search_num_of_hirakinaori'

describe "search_num_of_hirakinaori" do

  [ [ [ 3, 3, 4, 5 ], 3435],
    [ [ 1          ], 1   ],
    [ [ 1, 2, 3, 4 ], nil ],
    [ [ 1, 2, 3    ], nil ],
  ].each do |args, answer|
    it "search_num_of_hirakinaori(*#{args}) is #{answer}" do
      search_num_of_hirakinaori(*args).should == answer
    end
  end
end

describe "make_numbers" do
  it "" do
    make_numbers(2).size == 55
  end
end
