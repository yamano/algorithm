# -*- coding: utf-8 -*-
require 'rubygems'
require 'mechanize'
require 'kconv'

class Tdiary
  
  def initialize(url)
    @url =url
    @agent = Mechanize.new
    @agent.get(url)
    @data
  end
  attr_accessor :url, :agent, :data

  def latest
    @agent.get(url)
    latest_date = agent.page.search('a')[1].inner_text
    latest_date[4] = "-"
    latest_date[7] = "-"
    latest_date[10] = ""

    latest_body = agent.page.search('p')[0].inner_text[2..-1]
    
    @data = { :date => latest_date, :body => latest_body}
  end

  def has_new_diary
    @data != latest
  end

end

if $0 == __FILE__

  yamano = Tdiary.new("http://yamano.nsp.ricoh.co.jp:8000/tdiary/")
  
  yamano.latest

  while true
  
    if yamano.has_new_diary
      p "更新"
      p yamano.data[:date]
      p yamano.data[:body]
    end
    sleep 1

  end
end
