# -*- coding: utf-8 -*-
class Gragh
  def initialize(matrix, stations)
    @stations_hash = {}
    stations.each do |station|
      @stations_hash[station] = Station.new(station)
    end
    
    @_hash = {}
    stations.each.with_index do |station, index|
      @adjancency = {station => matrix[index]})
    end
    
  end
  attr_accessor :adjancency, :stations_hash

  def solve_shortest_distance(start_station, goal_station)
    start_station.distance = 0
    stations.each do |station|
      update_distance
    end
  end
  
  def update_distance
    
  end
  
  def check_distance
    
  end
  
end

class Station
  def initialize(name)
    @name  =  name
    @distance = -1
    @course = []
  end
  attr_accessor :name, :distance, :course
end

if $0 == __FILE__
  matrix  =  [[1, 2],
              [3, 4]]
  
  stations  =  [:abc, :def]
  gragh = Gragh.new(matrix, stations)
  #gragh.solve_shortest_distance(stations[0], stations[1])
end
