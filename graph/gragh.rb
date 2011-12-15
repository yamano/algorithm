# -*- coding: utf-8 -*-
class Gragh
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

  end
  attr_accessor :nodes_data, :time_table
  
  def solve_shortest_time(start_node)
    # スタート地点の移動時間と経路を初期化。
    @nodes_data[start_node].transit_time = 0
    @nodes_data[start_node].course = [start_node]
    # 次の
    update(start_node, start_node)
  end
  
  def update(prev_node, current_node)
    @time_table[current_node].each_pair do |next_node, time|      
      # 隣接しているnodeを探す。
      unless time == 0
        # 以前いたノードの経路に次のノードが含まれていないことを確認。
        unless @nodes_data[prev_node].course.index(next_node)
          new_transit_time = @nodes_data[current_node].transit_time + time
          # 新しい移動時間のほうが短ければ移動時間と経路を更新。
          if compare_transit_time(@nodes_data[next_node].transit_time, new_transit_time)
            @nodes_data[next_node].transit_time = new_transit_time
            @nodes_data[next_node].course = @nodes_data[current_node].course + [next_node]
            update(current_node, next_node)
          end
        end  
      end
    end
  end

  def compare_transit_time(old_transit_time, new_transit_time)
    old_transit_time == nil || new_transit_time < old_transit_time
  end


end

class Node
  def initialize(name)
    @name = name
    @transit_time
    @course = []
  end
  attr_accessor :name, :transit_time, :course
end

if $0 == __FILE__
  matrix = [[ 0,  3, 10,  0],
            [ 3,  0,  4, 15],
            [10,  4,  0, 10],
            [ 0, 15, 10,  0]]
  
  stations = [:a, :b, :c, :d]
  gragh = Gragh.new(matrix, stations)
  gragh.solve_shortest_time(:a)
  p gragh.nodes_data[:d].course
  p gragh.nodes_data[:d].transit_time
end
