# -*- coding: utf-8 -*-
require './tree.rb'


describe Tree_node do
  before do
    @tree_node = Tree_node.new(10)
    @tree_node.insert_tree(20)
    @tree_node.insert_tree(15)
    @tree_node.insert_tree(25)
    @tree_node.insert_tree(30)
  end

#Todo custom_matcherを使ってテストを書く。

=begin
  Spec::Matchers.define :matcher do |node, value, left, right| 
    match do
      #node.value == value
      #node.left  == left
      #node.right == right
    end
  end
 
  context 'initialize test' do
    it { should matcher(@tree_node, 10, nil, nil)}
  end

    it { should matcher(@tree_node, 10, nil, 20)}
    it { should matcher(@tree_node.right, 20, 15, 25)}
    it { should matcher(@tree_node.right.right, 25, nil, 30)}
=end

  context 'find_parent test' do
    it { @tree_node.find_parent(10).should == [ 10, nil ] }
    it { @tree_node.find_parent(5).should  == nil }
    it { @tree_node.find_parent(20).should == [ 20, 10 ] }
    it { @tree_node.find_parent(30).should == [ 30, 25 ] }
  end

  context 'delete test' do
    it { @tree_node.delete_node(15).should == true }
    it { @tree_node.delete_node(5).should  == false }
    it { @tree_node.delete_node(25).should  == true }

    it '' do
      @tree_node.delete_node(15)
      @tree_node.find_parent(20).first.left.should be_nil
    end
      # @tree_node.find_parent(30).first.left.should 
    #it { @tree_node.delete_node(25).should == true }
  end
end

describe Tree_node do
  before do
    @tree_node = Tree_node.new(20)
    @tree_node.insert_tree(5)
    @tree_node.insert_tree(30)
  end

  it '' do
    @tree_node.delete_node(5)
    @tree_node.find_parent(20).first.left.should be_nil
  end
  
  it '' do
    @tree_node.delete_node(30)
    @tree_node.find_parent(20).first.right.should be_nil
  end

end

