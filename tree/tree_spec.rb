require './tree.rb'


describe Tree_node do
  before do
    @tree_node = Tree_node.new(10)
  end

  shared_examples_for 'tree node value' do |value, left, right|
    it { @tree_node.value.should == value }
    it { @tree_node.left.should  == left  }
    it { @tree_node.right.should == right }
  end

  shared_examples_for 'tree nodes value' do |node, value, left, right|
    it { node.value.should == value }
    it { node.left.should  == left  }
    it { node.right.should == right }
  end

  it_should_behave_like 'tree node value', 10, nil, nil
  it_should_behave_like 'tree nodes value', Tree_node.new(10), 10, nil, nil
  #it_should_behave_like 'tree nodes value', @tree_node, 10, nil, nil

  context '' do
    before do
      @tree_node.insert_tree(20)
      @tree_node.insert_tree(5)
    end

    it_should_behave_like 'tree node value', 10, 5, 20
  end

  context '' do
    before do
      @tree_node.insert_tree(20)
      @tree_node.insert_tree(15)
      @tree_node.insert_tree(25)
      @tree_node.insert_tree(30)
      @tree_node.insert_tree(35)
    end
    
    it_should_behave_like 'tree node value', 10, nil, 20
    #it_should_behave_like 'tree nodes value', Tree_node.new(10).right, 20 , 15, 25
   


    it { @tree_node.right.right.should == 25 }
    it { @tree_node.right.right.right.should == 30 }
    it { @tree_node.right.right.right.right.should == 35 }
    it { @tree_node.right.right.right.left.should == nil }
  end
end
