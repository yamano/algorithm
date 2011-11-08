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
