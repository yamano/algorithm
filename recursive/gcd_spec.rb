# -*- coding: utf-8 -*-
require './gcd'

describe "gcd" do
  context '0が入ってない場合' do
    [ [    8,  12,  4 ],
      [  150,  45, 15 ],
      [ -150,  45, 15 ],
      [  150, -45, 15 ],
      [ -150, -45, 15 ],
      [    3,   5,  1 ],
    ].each do |a, b, answer|
      it "gcd(#{a}, #{b}) は #{answer}" do
        gcd(a, b).should == answer
      end
    end
  end

  context '0が入っている場合' do
    it { expect { gcd(0, 4) }.to raise_exception(ArgumentError) }
  end
end

describe 'gcd_multi' do
  context '0が入ってない場合' do
    [ [ [ 12,   8, 24 ], 4 ],
      [ [ 45, 150, 90 ], 15 ],
      [ [ 3 ], 3 ],
   ].each do |args, answer|
      it { gcd_multi(*args).should == answer}
    end
  end

  context '0が入っている場合' do
    it { expect { gcd_multi(0, 4, 8) }.to raise_exception(ArgumentError) }
  end
end
