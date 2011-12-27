# -*- coding: utf-8 -*-
require File.expand_path("tdiary", File.dirname(__FILE__))


describe "tdiary" do

  before do
    @yamano = Tdiary.new("http://yamano.nsp.ricoh.co.jp:8000/tdiary/")
    @yamano.latest
  end
  
  it "dateでアクセスすれば最新の日記の日付である2011-12-27が返される。" do
    @yamano.data[:date].should == "2011-12-27"
  end

  it "titleでアクセスすれば最新の日記のタイトルであるtitleが返される。" do
    @yamano.data[:title].should == "title"
  end

  it "bodyでアクセスすれば最新の日記の本文であるbodyが返される。" do
    @yamano.data[:body].should == "body"
  end

  it "" do
    @yamano.has_new_diary.should == false
  end
  
  it "access_edit_displayをすることでtdiaryの日付に対応したuuapの編集画面のurlを取得できる" do
    @yamano.access_edit_display
    @yamano.uuap_url.should == "http://uuap.src.ricoh.co.jp/index.php?cmd=edit&page=%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD%2F2011-12-27&refer=%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD"
  end

end
