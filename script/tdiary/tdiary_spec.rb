require File.expand_path("tdiary", File.dirname(__FILE__))

describe "tdiary" do

  before do
    @yamano = Tdiary.new("http://yamano.nsp.ricoh.co.jp:8000/tdiary/")
  end

  it "" do
    @yamano.latest.should == { :date => "2011-12-21", :body => "test."}
  end
  
  it "" do
    @yamano.latest
    @yamano.has_new_diary.should == false
  end

end
