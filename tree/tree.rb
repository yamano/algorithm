class Tree_node

  def initialize(value = nil)
    @value = value
  end
  attr_accessor :value, :left, :right

  def insert_tree(value)
    unless @value
      @value = value
    else
      if @value > value
        @left ||= self.class.new
        @left.insert_tree(value)
      else
        @right ||= self.class.new
        @right.insert_tree(value)
      end
    end
  end

  def ==(node)
    if node.is_a?(Tree_node)
      self.value == node.value
    else
      self.value == node
    end
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
