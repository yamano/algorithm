# -*- coding: utf-8 -*-
require File.expand_path("gragh", File.dirname(__FILE__))

describe "gragh" do

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
      @gragh = Gragh.new(matrix, nodes)
    end

    it "nodes_data[:a]のtransit_timeに初期値であるnilが入っている" do
      @gragh.nodes_data[:a].transit_time.should == nil
    end
    
    it "nodes_data[:a]のcourseに初期値である[]が入っている" do
      @gragh.nodes_data[:a].course.should == []
    end

    it "出発地と到着地から移動時間を出力。bからdまでは15が返ってくる" do
      @gragh.time_table[:b][:d].should == 15
    end
      
  end

  context "各メソッドのテスト" do
    
    before do
      @gragh2 = Gragh.new
    end

    it "新しい値が小さければtrue、大きければfalseが返る。また、古い値がnilでもtrueを返す。" do
      @gragh2.compare_transit_time(10, 20).should == false
      @gragh2.compare_transit_time(20, 10).should == true
      @gragh2.compare_transit_time(nil, 10).should == true
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
      
      @gragh3 = Gragh.new(matrix, stations)
      @gragh3.solve_shortest_time(:yokohama)
    end
    
    it "yokohamaまで最短経路で行ったときの移動時間は22となる" do
      @gragh3.nodes_data[:yokohama].transit_time.should == 0
    end

    it "yokohamaまでの最短経路はyokohama, musakikosugi, shinagawaとなる" do
      @gragh3.nodes_data[:yokohama].course.should == [:yokohama]
    end

    it "shinagawaまで最短経路で行ったときの移動時間は22となる" do
      @gragh3.nodes_data[:shibuya].transit_time.should == 25
    end
    
    it "shinagawaまでの最短経路はyokohama, musakikosugi, shinagawaとなる" do
    @gragh3.nodes_data[:shibuya].course.should == [:yokohama, :musashikosugi, :shibuya]
    end
      
    it "tameikesannnouまで最短経路で行ったときの移動時間は33となる" do
      @gragh3.nodes_data[:tameikesannou].transit_time.should == 33
    end
    
    it "tameikesannnouまでの最短経路はyokohama, musakikosugi, shinagawa, shinbashi, tameikesannouとなる" do
      @gragh3.nodes_data[:tameikesannou].course.should == [:yokohama, :musashikosugi, :shinagawa, :shinbashi, :tameikesannou]
    end

  end

end
