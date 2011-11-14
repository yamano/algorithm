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
      max_node = node.left.search_max_node
      if parent > node
        parent.left.value = max_node.value
        # node.left.search_max_node = nil
      elsif
        parent.right.value = max_node.value
        # node.left.search_max_node = nil
      end
    elsif node.left
      if parent > node
        parent.left.value = node.left.value
        node.left = nil
      else
        parent.right.value = node.left.value
        node.left = nil
      end
    elsif node.right
      if parent > node
        parent.left.value  = node.right.value
        node.right = nil
      else
        parent.right.value = node.right.value
        node.right = nil
      end
    else
      clear(which(node))
    end
    
  end

  def search_max_node
    if self.right
      self.right.search_max_node
    else
      self
    end
  end

  def swap_node(node, parent)
    
    #node, parent = parent, node
  end
end

if $0 == __FILE__
  tree_node = Tree_node.new(20)
  tree_node.insert_tree(15)
  tree_node.insert_tree(10)
  tree_node.insert_tree(18)
  tree_node.insert_tree(5)
  tree_node.insert_tree(13)
  tree_node.insert_tree(30)
  tree_node.insert_tree(25)
  tree_node.insert_tree(23)
  tree_node.insert_tree(28)
  tree_node.insert_tree(35)
  tree_node.delete_node(15)
  tree_node.delete_node(30)
  

  p tree_node.right.left.right.value
end
