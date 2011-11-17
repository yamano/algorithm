# -*- coding: utf-8 -*-
require './binary_tree.rb'

Spec::Matchers.define :matcher do |value, left, right|
  match do |node|
    node.value == value && node.left == left && node.right == right
  end
end

describe BinaryTree do
  before do
    @tree_node = BinaryTree.new(10)
    @tree_node.insert_node(20)
    @tree_node.insert_node(15)
    @tree_node.insert_node(25)
    @tree_node.insert_node(30)
  end

  context 'custom_matcher test' do
    it { @tree_node.should matcher(10, nil, 20)}
    it { @tree_node.right.should matcher(20, 15, 25)}
    it { @tree_node.right.right.should matcher(25, nil, 30)}
  end

  context 'find_parent test' do
    it { @tree_node.find_parent(10).should == [ 10, nil ] }
    it { @tree_node.find_parent(5).should  == nil }
    it { @tree_node.find_parent(20).should == [ 20, 10 ] }
    it { @tree_node.find_parent(30).should == [ 30, 25 ] }
  end

end

describe BinaryTree do
  before do
    @tree_node = BinaryTree.new(20)
    @tree_node.insert_node(10)
    @tree_node.insert_node(15)
    @tree_node.insert_node(13)
    @tree_node.insert_node(18)
    @tree_node.insert_node(30)
  end

  context '2分木から葉を削除する' do
    it '' do
      @tree_node.delete_node(30)
      @tree_node.should matcher(20, 10, nil)
    end
  end

  context '1つだけ子ノードを持つノードを削除する' do
    it '' do
      @tree_node.delete_node(10)
      @tree_node.should matcher(20, 15, 30)
      @tree_node.left.should matcher(15, 13, 18)
    end
  end

end

describe BinaryTree do
  before do
    @tree_node = BinaryTree.new(20)
    @tree_node.insert_node(15)
    @tree_node.insert_node(10)
    @tree_node.insert_node(18)
    @tree_node.insert_node(5)
    @tree_node.insert_node(13)
    @tree_node.insert_node(30)
    @tree_node.insert_node(25)
    @tree_node.insert_node(23)
    @tree_node.insert_node(28)
    @tree_node.insert_node(26)
    @tree_node.insert_node(27)
    @tree_node.insert_node(35)
    @tree_node.insert_node(40)
    @tree_node.delete_node(15)
    @tree_node.delete_node(30)
  end

  #it '' do
   # *(get(which(13)).find_parent(13).should).value == [20,13]
  #end

  context '子孫を持つノードを削除する' do
    it '' do
      @tree_node.should matcher(20, 13, 28)
      @tree_node.right.should matcher(28, 25, 35)
      @tree_node.right.right.should matcher(35, nil, 40)
      @tree_node.right.left.should matcher(25, 23, 26)
      @tree_node.right.left.right.should matcher(26, nil, 27)
    end
  end

end
