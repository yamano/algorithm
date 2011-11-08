require './search_num_of_hirakinaori'

describe "search_num_of_hirakinaori" do
  it "" do
    search_num_of_hirakinaori(*[ 3, 3, 4, 5 ]).should == 3435
  end
  it "" do
    search_num_of_hirakinaori(*[1]).should == 1
  end

  it "" do
    search_num_of_hirakinaori(*[1,2,3]).should == nil
  end

  it "" do
    search_num_of_hirakinaori(*[1]).should == 1
  end
end
