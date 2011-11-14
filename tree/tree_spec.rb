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

  Spec::Matchers.define :matcher do |value, left, right| 
    match do |node|
      node.value == value && node.left == left && node.right == right
    end
  end
 
  it { @tree_node.should matcher(10, nil, 20)}
  it { @tree_node.right.should matcher(20, 15, 25)}
  it { @tree_node.right.right.should matcher(25, nil, 30)}

  context 'find_parent test' do
    it { @tree_node.find_parent(10).should == [ 10, nil ] }
    it { @tree_node.find_parent(5).should  == nil }
    it { @tree_node.find_parent(20).should == [ 20, 10 ] }
    it { @tree_node.find_parent(30).should == [ 30, 25 ] }
  end

end

describe Tree_node do
  before do
    @tree_node = Tree_node.new(20)
    @tree_node.insert_tree(5)
    @tree_node.insert_tree(30)
    @tree_node.delete_node(5)
  end

  it '' do
    @tree_node.find_parent(20).first.left.should be_nil
  end

end

describe Tree_node do
  before do
    @tree_node = Tree_node.new(20)
    @tree_node.insert_tree(10)
    @tree_node.insert_tree(15)
    @tree_node.insert_tree(30)
  end

  Spec::Matchers.define :matcher do |value, left, right| 
    match do |node|
      node.value == value && node.left == left && node.right == right
    end
  end

  it '' do
    @tree_node.delete_node(10)
    @tree_node.should matcher(20, 15, 30)
    @tree_node.left.should matcher(15, nil, nil)
  end

  it '' do
    @tree_node.delete_node(30)
    @tree_node.should matcher(20, 10, nil)
  end

end

describe Tree_node do
  before do
    @tree_node = Tree_node.new(20)
    @tree_node.insert_tree(15)
    @tree_node.insert_tree(10)
    @tree_node.insert_tree(18)
    @tree_node.insert_tree(5)
    @tree_node.insert_tree(13)
    @tree_node.insert_tree(30)
    @tree_node.insert_tree(25)
    @tree_node.insert_tree(23)
    @tree_node.insert_tree(28)
    @tree_node.insert_tree(35)
  end

  it{ @tree_node.left.left.search_max_node.should == @tree_node.left.left.right }
  it{ @tree_node.right.left.search_max_node.should == @tree_node.right.left.right }

end


describe Tree_node do
  before do
    @tree_node = Tree_node.new(20)
    @tree_node.insert_tree(15)
    @tree_node.insert_tree(10)
    @tree_node.insert_tree(18)
    @tree_node.insert_tree(5)
    @tree_node.insert_tree(13)
    @tree_node.insert_tree(30)
    @tree_node.insert_tree(25)
    @tree_node.insert_tree(23)
    @tree_node.insert_tree(28)
    @tree_node.insert_tree(35)
    @tree_node.delete_node(15)
    @tree_node.delete_node(30)
  end

  Spec::Matchers.define :matcher do |value, left, right| 
    match do |node|
      node.value == value && node.left == left && node.right == right
    end
  end

  it '' do
    @tree_node.should matcher(20, 13, 28)
    @tree_node.right.should matcher(28, 25, 35)
    # @tree_node.right.left.should matcher(25, 23, nil)
  end

end
