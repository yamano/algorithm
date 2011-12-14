# -*- coding: utf-8 -*-
class Gragh
  def initialize(matrix, nodes)
    @node_data = {}
    nodes.each do |node|
      @node_data[node] = Node.new(node)
    end
    
    @time_table = {}
    nodes.each.with_index do |origin_node, origin_index|
      table  =  {}
      nodes.each.with_index do |destination_node, destination_index|
        table[destination_node] = matrix[origin_index][destination_index]
      end
      @time_table[origin_node] = table
    end

  end
  attr_accessor :node_data, :time_table
  
  def solve_shortest_time(start_node, goal_node)
    @node_data[start_node].transit_time = 0
    #@node_data[start_node].course = [start_node]
    update_transit_value(start_node, start_node, goal_node)
  end
  
  def update_transit_value(before_node, present_node, goal_node)
    
    @time_table[present_node].each_pair do |node, time|
      unless @node_data[before_node].course.index(node)
        unless time == 0
          p node
          p @node_data[node].transit_time = time + @node_data[before_node].transit_time
          p @node_data[node].course = @node_data[before_node].course + [node]
          #unless node == before_node
            update_transit_value(present_node, node, goal_node)
          #end
        end
      else
      return @node_data[goal_node].transit_time if present_node == goal_node
      end    
    end
  end
#  end
  
#  def check_distance
    
    
#  end
  
end

class Node
  def initialize(name)
    @name  =  name
    @transit_time = -1
    @course = []
    @check = 0
  end
  attr_accessor :name, :transit_time, :course, :check
end

if $0 == __FILE__
  matrix  =  [[0, 2, 0],
              [2, 0, 3],
              [0, 3, 0]]
  
  stations  =  [:a, :b, :c]
  gragh = Gragh.new(matrix, stations)
  p gragh.solve_shortest_time(:a, :c)
  p gragh.node_data[:c].course
end
