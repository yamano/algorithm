# -*- coding: utf-8 -*-
require './binary_tree.rb'

Spec::Matchers.define :match_node do |value, left, right|
  match do |node|
    node.value == value && node.left == left && node.right == right
  end
end

describe BinaryTree do
  before do
    @root = BinaryTree.new(10, "starfish")
    @root.insert_node(20, "squid")
    @root.insert_node(15, "krill")
    @root.insert_node(25, "octopus")
    @root.insert_node(30, "swordfish")
  end

  context 'custom_matcher test' do
    it { @root.should match_node("starfish", nil, "squid")}
    it { @root.right.should match_node("squid", "krill", "octopus")}
    it { @root.right.right.should match_node("octopus", nil, "swordfish")}
  end

  context 'insert test' do
    it { @root.insert_node(10,"squid").should == nil }
  end

  context 'find_parent test' do
    it { @root.find_parent(10).map{|node| node }.should == [ "starfish", nil ] }
    it { @root.find_parent(5).map{ |node| node }.should == [ nil , nil ] }
    it { @root.find_parent(22).map{|node| node }.should == [ nil , nil ] }
    it { @root.find_parent(20).map{|node| node }.should == [ "squid", "starfish" ] }
    it { @root.find_parent(30).map{|node| node }.should == [ "swordfish", "octopus" ] }
    it { @root.find_parent(35).map{|node| node }.should == [ nil, nil ] }
  end

end

describe BinaryTree do
  before do
    @root = BinaryTree.new(20, "starfish")
    @root.insert_node(10, "krill")
    @root.insert_node(15, "medusa")
    @root.insert_node(13, "otter")
    @root.insert_node(18, "dolphin")
    @root.insert_node(30, "squid")
  end

  context '2分木から葉を削除する' do
    it do
      @root.delete_node(30)
      @root.should match_node("starfish", "krill", nil)
    end
  end

  context '右にだけ子ノードを持つノードを削除する' do
    it do
      @root.delete_node(10)
      @root.should match_node("starfish", "medusa", "squid")
      @root.left.should match_node("medusa", "otter", "dolphin")
    end
  end

end

describe BinaryTree do
  before do
    @root = BinaryTree.new(20, "starfish")
    @root.insert_node(15, "krill")
    @root.insert_node(10, "beluga")
    @root.insert_node(18, "medusa")
    @root.insert_node(5, "dolphin")
    @root.insert_node(13, "grampus")
    @root.insert_node(30, "squid")
    @root.insert_node(25, "orca")
    @root.insert_node(23, "otter")
    @root.insert_node(28, "swordfish")
    @root.insert_node(26, "octopus")
    @root.insert_node(27, "hoge")
    @root.insert_node(35, "fuga")
    @root.insert_node(40, "abcd")
    @root.delete_node(15)
    @root.delete_node(30)
  end

  context '左に子ノードを持つノードを削除する' do
    it do
      @root.should match_node("starfish", "grampus", "swordfish")
      @root.right.should match_node("swordfish", "orca", "fuga")
      @root.right.right.should match_node("fuga", nil, "abcd")
      @root.right.left.should match_node("orca", "otter", "octopus")
      @root.right.left.right.should match_node("octopus", nil, "hoge")
    end
  end

end

