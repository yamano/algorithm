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
      self.key > node.key
    else
      self.key > node
    end
  end

  def <(node)
    if node.is_a?(BinaryTree)
      self.key < node.key
    else
      self.key < node
    end
  end

  def ==(node)
    if node.is_a?(BinaryTree)
      self.value == node.value
    else
      self.value == node
    end
  end

  def find_parent_value(key)
    if self.key == key
      return [ self.value, nil ]
    elsif (@left && @key > key ) || ( @right && @key <= key )
      node, parent = *get(which(key)).find_parent_value(key)
      unless parent
        return node, self.value
      else
        return node, parent
      end
    end
    nil
  end

  def find_parent(key)
    if self.key == key
      return [ self, nil ]
    elsif (@left && @key > key ) || ( @right && @key <= key )
      node, parent = *get(which(key)).find_parent(key)
      unless parent
        return node, self
      else
        return node, parent
      end
    end
    nil
  end

  def delete_node(key)
    node, parent = *find_parent(key)
    if node.left
      target_node, target_parent = *find_parent(find_target_to_swap(node).key)
      node.key = target_node.key
      node.value = target_node.value
      target_parent.right = target_node.left
    elsif node.right
      parent.left  = node.right if parent >  node
      parent.right = node.right if parent < node
    else
      parent.clear(which(node))
    end
  end
  
  def find_target_to_swap(node)
    if node.left
      node.left.search_max_node
    elsif node.right
      node.right
    else
      nil
    end
  end
  
  def search_max_node
    if self.right
      self.right.search_max_node
    else
      self
    end
  end

end

if $0 == __FILE__
  tree_node = BinaryTree.new(10, "starfish")
  tree_node.insert_node(25, "squid")
  tree_node.insert_node(15, "krill")

  p tree_node.right.value
end
