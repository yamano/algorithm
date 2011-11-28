require './eight_queen.rb'

describe 'EightQueen' do

  before do
    @e_q = EightQueen.new
    @e_q.board[0][0] = true
    @e_q.board[0][3] = true
    @e_q.board[0][7] = true
  end
  
  it 'left_check_test' do
    @e_q.check(5, 3).should == false
  end

  it 'upper_left_check_test' do
    @e_q.check(1, 1).should == false
    @e_q.check(4, 7).should == false
  end

  it 'lower_left_check_test' do
    @e_q.check(5, 2).should == false
    @e_q.check(1, 6).should == false
  end

  it 'check_test' do
    @e_q.check(7, 8).should == true
    @e_q.check(6, 2).should == true
  end

end

describe 'EightQueen' do
  
  before do
    @e_q = EightQueen.new
    @e_q.solve(0)
  end

  it 'solve_test' do
    @e_q.answer_array[0].should == [[true, false, false, false, false, false, false, false],
                                   [false, false, false, false, true, false, false, false],
                                   [false, false, false, false, false, false, false, true],
                                   [false, false, false, false, false, true, false, false],
                                   [false, false, true, false, false, false, false, false],
                                   [false, false, false, false, false, false, true, false],
                                   [false, true, false, false, false, false, false, false],
                                   [false, false, false, true, false, false, false, false]]
  end

  it 'multi_solve_test' do
    @e_q.answer_array.size.should == 92
  end

end
