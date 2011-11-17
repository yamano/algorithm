class BinaryTree

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

  def insert_node(value)
    unless @value
      @value = value
    else
      get(which(value)).insert_node(value)
    end
  end

  def >(node)
    if node.is_a?(BinaryTree)
      self.value > node.value
    else
      self.value > node
    end
  end

  def <(node)
    if node.is_a?(BinaryTree)
      self.value < node.value
    else
      self.value < node
    end
  end

  def ==(node)
    if node.is_a?(BinaryTree)
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

=begin
  def find_parent(value)
    if self == value
      return [ self, nil ]
      if @left || @right
        node, parent = *get(which(value)).find_parent(value)
        p node.value
        unless parent
          return node, self
        else
          return node, parent
        end
      end
      nil
    end
  end
=end


  def delete_node(value)
    node, parent = *find_parent(value)
    if node.left
      target_node, target_parent = *self.find_parent(find_target_to_swap(node).value)
      node.value = target_node.value
      #get(which(target_node.value)) = target_node.left
      if target_parent < target_node
        target_parent.right = target_node.left
      elsif
        target_parent.left = target_node.left
      end
      #swap_delete_node(node, find_target_to_swap(node))
    elsif node.right
      if parent < node
        parent.right = node.right
      else
        parent.left = node.right
      end
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
  
  def swap_delete_node(node, target)
    #node.value, target. = target.value, target.left ||= self.class.new
  end
  
  def swap_node(node)
    if node.right
      node = node.right
    else 
      node = nil
    end
  end

end

if $0 == __FILE__
  tree_node = BinaryTree.new(20)
  tree_node.insert_node(15)
  tree_node.insert_node(10)
  tree_node.insert_node(18)
  tree_node.insert_node(5)
  tree_node.insert_node(13)
  tree_node.insert_node(30)
  tree_node.insert_node(25)
  tree_node.insert_node(23)
  tree_node.insert_node(28)
  tree_node.insert_node(35)
  tree_node.delete_node(15)
  #tree_node.delete_node(30)
  
  #b, c = *tree_node.get(tree_node.which(10)).find_parent(10)
  #p d, e = *tree_node.find_parent(10)
  #p b.value, c.value
end
