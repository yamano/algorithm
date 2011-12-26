# -*- coding: utf-8 -*-
require File.expand_path("tdiary", File.dirname(__FILE__))


describe "tdiary" do

  before do
    @yamano = Tdiary.new("http://yamano.nsp.ricoh.co.jp:8000/tdiary/")
  end
  
  it "" do
    @yamano.latest[:date].should == "2011-12-26"
    @yamano.latest[:title].should == "自動反映スクリプト作成。"
  end
  
  it "" do
    @yamano.latest
    @yamano.has_new_diary.should == false
  end
  
  it "" do
    @yamano.latest
    @yamano.access_edit_display
    @yamano.uuap_url.should == "http://uuap.src.ricoh.co.jp/index.php?cmd=edit&page=%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD%2F2011-12-26&refer=%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD"
  end

end
