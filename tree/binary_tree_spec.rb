# -*- coding: utf-8 -*-
require './binary_tree.rb'

Spec::Matchers.define :match_node do |value, left, right|
  match do |node|
    node.value == value && node.left == left && node.right == right
  end
end

describe BinaryTree do
  before do
    @tree_node = BinaryTree.new(10, "starfish")
    @tree_node.insert_node(20, "squid")
    @tree_node.insert_node(15, "krill")
    @tree_node.insert_node(25, "octopus")
    @tree_node.insert_node(30, "swordfish")
  end

  context 'custom_matcher test' do
    it { @tree_node.should match_node("starfish", nil, "squid")}
    it { @tree_node.right.should match_node("squid", "krill", "octopus")}
    it { @tree_node.right.right.should match_node("octopus", nil, "swordfish")}
  end

  context 'insert test' do
    it { @tree_node.insert_node(10,"squid").should == nil }
  end

  context 'find_parent test' do
    it { @tree_node.find_parent_value(10).should == [ "starfish", nil ] }
    it { @tree_node.find_parent_value(5).should  == nil }
    it { @tree_node.find_parent_value(20).should == [ "squid", "starfish" ] }
    it { @tree_node.find_parent_value(30).should == [ "swordfish", "octopus" ] }
  end

end

describe BinaryTree do
  before do
    @tree_node = BinaryTree.new(20, "starfish")
    @tree_node.insert_node(10, "krill")
    @tree_node.insert_node(15, "medusa")
    @tree_node.insert_node(13, "otter")
    @tree_node.insert_node(18, "dolphin")
    @tree_node.insert_node(30, "squid")
  end

  context '2分木から葉を削除する' do
    it '' do
      @tree_node.delete_node(30)
      @tree_node.should match_node("starfish", "krill", nil)
    end
  end

  context '右にだけ子ノードを持つノードを削除する' do
    it '' do
      @tree_node.delete_node(10)
      @tree_node.should match_node("starfish", "medusa", "squid")
      @tree_node.left.should match_node("medusa", "otter", "dolphin")
    end
  end

end

describe BinaryTree do
  before do
    @tree_node = BinaryTree.new(20, "starfish")
    @tree_node.insert_node(15, "krill")
    @tree_node.insert_node(10, "beluga")
    @tree_node.insert_node(18, "medusa")
    @tree_node.insert_node(5, "dolphin")
    @tree_node.insert_node(13, "grampus")
    @tree_node.insert_node(30, "squid")
    @tree_node.insert_node(25, "orca")
    @tree_node.insert_node(23, "otter")
    @tree_node.insert_node(28, "swordfish")
    @tree_node.insert_node(26, "octopus")
    @tree_node.insert_node(27, "hoge")
    @tree_node.insert_node(35, "fuga")
    @tree_node.insert_node(40, "abcd")
    @tree_node.delete_node(15)
    @tree_node.delete_node(30)
  end

  context '左に子ノードを持つノードを削除する' do
    it '' do
      @tree_node.should match_node("starfish", "grampus", "swordfish")
      @tree_node.right.should match_node("swordfish", "orca", "fuga")
      @tree_node.right.right.should match_node("fuga", nil, "abcd")
      @tree_node.right.left.should match_node("orca", "otter", "octopus")
      @tree_node.right.left.right.should match_node("octopus", nil, "hoge")
    end
  end

end

