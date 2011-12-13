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
    @gragh.adjancency.should == [{ :yokohama => [  0, 12, 28,  0, 0, 0] },
                                 { :musashikosugi => [ 12,  0, 10, 13, 0, 0] },
                                 { :shinagawa => [ 28, 10,  0, 11, 7, 0] },
                                 { :shibuya => [  0, 13, 11,  0, 0, 9] },
                                 { :shinbashi => [  0,  0,  7,  0, 0, 4] },
                                 { :tameikesannou => [  0,  0,  0,  9, 4, 0] }]
    
    @gragh.adjancency[:yokohama].should  == [  0, 12, 28,  0, 0, 0]

    @gragh.stations_hash[:yokohama].distance.should == -1
  end

  it "" do
#    update_distance.should == nil
  end

  it "" do
#    check_distance.should == nil
  end

  it "" do
    @gragh.solve_shortest_distance(@stations[0], @stations[5]).should == 33
    @stations[5].course.should == ["横浜", "武蔵小杉", "品川", "新橋", "溜池山王"]
  end

end
