# -*- coding: utf-8 -*-
class Graph
  def initialize(matrix = [], nodes = [])
    # ノードのシンボルを渡せばクラスが返ってくるようにresultを初期化。
    @results = {}
    nodes.each do |node|
      @results[node] = Node.new(node)
    end
    
    # 出発地と到着地ののシンボルを渡せば隣接時間が返ってくるようにmatrixを初期化。
    @matrix = {}
    nodes.each.with_index do |origin_node, origin_index|
      table = {}
      nodes.each.with_index do |destination_node, destination_index|
        table[destination_node] = matrix[origin_index][destination_index]
      end
      @matrix[origin_node] = table
    end

    @nodes_with_path_length_queue = []
    @finished_nodes = []

  end
  attr_accessor :results, :matrix, :nodes_with_path_length_queue, :finished_nodes
  
  def reset
    @results.each_value do |node_class|
      node_class.path_length = nil
      node_class.course = []
    end
    @finished_nodes = []
  end

  def solve_shortest_path(start_node)
    reset
    update_tmp_result(start_node, start_node, 0)
    update_results
  end
  
  def update_results
    while current_node_with_path_length = @nodes_with_path_length_queue.sort! {|a,b| a[1] <=> b[1]}.shift
      current_node = current_node_with_path_length[0]
      current_path_length = current_node_with_path_length[1]

      if should_be_update?(current_node)
        @finished_nodes.push(current_node)
        @matrix[current_node].select{|node, length| length != 0}.each_pair do |next_node, path_length|
          new_path_length = current_path_length + path_length
          if shorter?(@results[next_node].path_length, new_path_length)
            update_tmp_result(current_node, next_node, new_path_length)
          end
        end

      end

    end
    nil
  end

  def update_tmp_result(current_node, next_node, new_path_length)
    @results[next_node].path_length = new_path_length
    @results[next_node].course = @results[current_node].course + [next_node]
    @nodes_with_path_length_queue.push([next_node, @results[next_node].path_length])
  end

  def should_be_update?(current_node)
    !@finished_nodes.include?(current_node)
    #@result[current_node].path_length == nil
  end

  def shorter?(old, new)
    old == nil || old > new
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
  p gragh.results[:d].course
  p gragh.results[:d].path_length
end
