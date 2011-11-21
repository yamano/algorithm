# -*- coding: utf-8 -*-
class BinaryTree
  def initialize(key = nil, value = nil)
    @key = key
    @value = value
  end
  attr_accessor :key, :value, :left, :right

  def get(direction)
    send("get_#{direction}")
  end

  def get_right
    @right ||= self.class.new
  end

  def get_left
    @left ||= self.class.new
  end

  def clear(direction)
    send("clear_#{direction}")
  end

  def clear_right
    @right = nil
  end

  def clear_left
    @left = nil
  end

  def which(key)
    if key < @key
      :left
      else
      :right
    end
  end

  def insert_node(key, value)
    #　同じキーは挿入しない。
    return nil if @key == key

    unless @key && @value
      @key = key
      @value = value
    else
      get(which(key)).insert_node(key, value)
    end
  end

  def >(node)
    if node.is_a?(BinaryTree)
      @key > node.key
    else
      @key > node
    end
  end

  def <(node)
    if node.is_a?(BinaryTree)
      @key < node.key
    else
      @key < node
    end
  end

  def ==(node)
    if node.is_a?(BinaryTree)
      @value == node.value
      @key   == node.key
    else
      self.value == node
    end
  end
  
  def has_children(direction)
    if direction
      send("has_children_#{direction}")
    else
      nil
    end
  end

  def has_children_left
    @left ? true : false
  end

  def has_children_right
    @right ? true : false
  end

  def find_parent(key)
    if @key == key
      return [ self, nil ]
    elsif has_children(which(key))
      node, parent = *get(which(key)).find_parent(key)
      if parent
        return [ node, parent ]
      elsif node
        return [ node, self ]
      else
        return [ nil, nil ]                            #nodeがnilなら、キーを探索できていないので[ nil, nil ]を返す。
      end
    end
    [ nil, nil ]
  end

  def set(direction, node)
    send("set_#{direction}", node)
  end

  def set_left(node)
    @left = node
  end

  def set_right(node)
    @right = node
  end
  
  def delete_node(key)
    node, parent = *find_parent(key)
    if node.left
      max_node, max_parent = *find_parent(node.left.find_max_node.key)
      node.key = max_node.key
      node.value = max_node.value
      max_parent.right = max_node.left
    elsif node.right
      parent.set(parent.which(node), node.right)
    else
      parent.clear(which(node))
    end
  end
  
  def find_max_node
    if @right
      @right.find_max_node
    else
      self
    end
  end

end

if $0 == __FILE__
  tree_node = BinaryTree.new(10, "starfish")
  tree_node.insert_node(20, "aaaaaaaaaa")
  tree_node.insert_node(25, "squid")
  tree_node.insert_node(15, "krill")
  tree_node.insert_node(30, "eeeeeeeeeee")

  p tree_node.find_parent(28).map{|a| a.key if a}
end
