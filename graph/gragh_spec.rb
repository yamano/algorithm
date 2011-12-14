# -*- coding: utf-8 -*-
require File.expand_path("gragh", File.dirname(__FILE__))

describe "gragh" do

  before do
    matrix  = [[  0, 12, 28,  0, 0, 0],
               [ 12,  0, 10, 13, 0, 0],
               [ 28, 10,  0, 11, 7, 0],
               [  0, 13, 11,  0, 0, 9],
               [  0,  0,  7,  0, 0, 4],
               [  0,  0,  0,  9, 4, 0]]

    stations  = [:yokohama, :musashikosugi, :shinagawa, :shibuya, :shinbashi, :tameikesannou]

    @gragh = Gragh.new(matrix, stations)
  end

  it "初期化テスト" do
    @gragh.time_table[:yokohama][:shinagawa].should == 28    


    @gragh.node_data[:yokohama].transit_time.should == -1
    @gragh.node_data[:yokohama].course.should == []
  end

  it "" do
#    update_distance.should == nil
  end

  it "" do
#    check_distance.should == nil
  end

  it "" do
    @gragh.solve_shortest_time(:yokohama, :tameikesannou).should == 33
  end
  
  it "" do
    @gragh.node_data[:tameikesannou].course.should == [:yokohama, :musashikosugi, :shinagawa, :shibuya, :shinbashi, :tameikesannou]
  end
end
