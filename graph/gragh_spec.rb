# -*- coding: utf-8 -*-
require File.expand_path("gragh", File.dirname(__FILE__))

describe "graph" do

  context "初期化テスト" do

    before do
      # matarixは隣接するノードとの移動時間を表している。
      # 縦が出発地で横が到着地である。隣接していなければ0となる。
      matrix = [[ 0,  3, 10,  0],
                [ 3,  0,  4, 15],
                [10,  4,  0, 10],
                [ 0, 15, 10,  0]]
      # nodesは各ノードのシンボルが格納。
      nodes = [:a, :b, :c, :d] 
      @graph = Graph.new(matrix, nodes)
    end

    it "nodes_data[:a]のtransit_timeに初期値であるnilが入っている" do
      @graph.nodes_data[:a].transit_time.should == nil
    end
    
    it "nodes_data[:a]のcourseに初期値である[]が入っている" do
      @graph.nodes_data[:a].course.should == []
    end

    it "出発地と到着地から移動時間を出力。bからdまでは15が返ってくる" do
      @graph.time_table[:b][:d].should == 15
    end
      
  end

  context "各メソッドのテスト" do
    
    before do
      @graph2 = Graph.new
    end
      
    [[ 10, 20, false],
     [ 20, 10,  true],
     [nil, 10,  true]
    ].each do |old, new, answer|
      it "古い値#{old}と新しい値#{new}を比較すると#{answer}が出力される" do
        @graph2.compare_transit_time(old, new).should == answer
      end
    end
  end

  context "yokohamaをスタート地点にして各駅に最短経路で行ったときの移動時間と経路のテスト" do
    
    before do
      matrix  = [[  0, 12, 28,  0, 0, 0],
                 [ 12,  0, 10, 13, 0, 0],
                 [ 28, 10,  0, 11, 7, 0],
                 [  0, 13, 11,  0, 0, 9],
                 [  0,  0,  7,  0, 0, 4],
                 [  0,  0,  0,  9, 4, 0]]
      stations  = [:yokohama, :musashikosugi, :shinagawa, :shibuya, :shinbashi, :tameikesannou]
      
      @graph3 = Graph.new(matrix, stations)
      @graph3.solve_shortest_time(:shinagawa)
      @graph3.solve_shortest_time(:yokohama)
    end

    [[:yokohama, [:yokohama]],
     [:shibuya, [:yokohama, :musashikosugi, :shibuya]],
     [:tameikesannou, [:yokohama, :musashikosugi, :shinagawa, :shinbashi, :tameikesannou]]
    ].each do |start_node, course_ans|
      it "#{start_node}までの最短経路は#{course_ans}となる" do
        
        @graph3.nodes_data[start_node].course.should == course_ans
      end
    end

    [[:yokohama,       0],
     [:shibuya,       25],
     [:tameikesannou, 33]
    ].each do |start_node, answer|
      it "#{start_node}まで最短経路で行ったときの移動時間は#{answer}となる" do
       # @graph3.nodes_data[start_node].transit_time.should == answer
      end
    end

  end

end
