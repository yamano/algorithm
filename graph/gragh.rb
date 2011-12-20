# -*- coding: utf-8 -*-
class Graph
  def initialize(matrix = [], nodes = [])
    # ノードのシンボルを渡せばクラスが返ってくるようにnodes_dataを初期化。
    @nodes_data = {}
    nodes.each do |node|
      @nodes_data[node] = Node.new(node)
    end
    
    # 出発地と到着地ののシンボルを渡せば隣接時間が返ってくるようにtime_tableを初期化。
    @time_table = {}
    nodes.each.with_index do |origin_node, origin_index|
      table = {}
      nodes.each.with_index do |destination_node, destination_index|
        table[destination_node] = matrix[origin_index][destination_index]
      end
      @time_table[origin_node] = table
    end

    @order_queue = []
    @finish_nodes = []

  end
  attr_accessor :nodes_data, :time_table, :order_queue, :finish_nodes
  
  def reset
    @nodes_data.each_value do |node_class|
      node_class.path_length = nil
      node_class.course = []
    end
    @finish_nodes = []
  end


  def solve_shortest_path(start_node)
    reset    
    update(start_node, start_node, 0)
    update_nodes_data
  end
  
  def update_nodes_data
    while current_node_with_path_length = @order_queue.sort! {|a,b| a[1] <=> b[1]}.shift
      current_node = current_node_with_path_length[0]
      current_path_length = current_node_with_path_length[1]
      if should_be_update?(current_node)
        @finish_nodes.push(current_node)        
        @time_table[current_node].select{|node, length| length != 0}.each_pair do |next_node, path_length|
          new_path_length = current_path_length + path_length
          if shorter?(@nodes_data[next_node].path_length, new_path_length)
            update(current_node, next_node, new_path_length)
          end
        end
      end
    end
    nil
  end

  def update(current_node, next_node, new_path_length)
    @nodes_data[next_node].path_length = new_path_length
    @nodes_data[next_node].course = @nodes_data[current_node].course + [next_node]
    @order_queue.push([next_node, @nodes_data[next_node].path_length])
  end

  def should_be_update?(current_node)
    !@finish_nodes.include?(current_node)
    #@nodes_data[current_node].path_length == nil
  end
  
  def shorter?(old, new)
    old == nil || new < old
  end

end

class Node
  def initialize(name)
    @name = name
    @path_length
    @course = []
  end
  attr_accessor :name, :path_length, :course
end

if $0 == __FILE__
  matrix = [[ 0,  3, 10,  0],
            [ 3,  0,  4, 15],
            [10,  4,  0, 10],
            [ 0, 15, 10,  0]]
  
  stations = [:a, :b, :c, :d]
  gragh = Graph.new(matrix, stations)
  gragh.solve_shortest_path(:a)
  p gragh.nodes_data[:d].course
  p gragh.nodes_data[:d].path_length
end
