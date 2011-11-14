class Tree_node

  def initialize(value = nil)
    @value = value
  end
  attr_accessor :value, :left, :right

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

  def which(value)
    if value < @value
      :left
    else
      :right
    end
  end

  def insert_tree(value)
    unless @value
      @value = value
    else
      get(which(value)).insert_tree(value)
    end
  end

  def >(node)
    if node.is_a?(Tree_node)
      self.value > node.value
    else
      self.value > node
    end
  end

  def <(node)
    if node.is_a?(Tree_node)
      self.value < node.value
    else
      self.value < node
    end
  end

  def ==(node)
    if node.is_a?(Tree_node)
      self.value == node.value
    else
      self.value == node
    end
  end

  def find_parent(value)
    if self == value
      return [ self, nil ]
    elsif @value > value
      if @left
        node, parent = *@left.find_parent(value)
        unless parent
          return node, self
        else
          return node, parent
        end
      end
    else
      if @right
        node, parent = *@right.find_parent(value)
        unless parent
          return node, self
        else
          return node, parent
        end
      end
    end
    nil
  end
  
  def delete_node(value)
    if ret = find_parent(value)
      node, parent = *ret
      parent.delete(node, parent)
      true
    else
      false
    end
  end
  
  def delete(node, parent)
    if node.left && node.right
      
    elsif node.left
      node.swap_node(node.left, parent)
    elsif node.right
      node.swap_node(node.right, parent)
    else
      
    end
    clear(which(node))
  end

  def swap_node(node, parent)
    node, parent = parent, node
  end
end

if $0 == __FILE__
  tree_node = Tree_node.new(10)
  tree_node.insert_tree(8)
  tree_node.left
  tree_node.left.left
  tree_node.insert_tree(3)
  tree_node.left.left
end
