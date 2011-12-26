# -*- coding: utf-8 -*-
require 'rubygems'
require 'mechanize'
require 'kconv'

class Tdiary
  
  def initialize(url)
    @url = url
    @uuap_url 
    @agent = Mechanize.new
    @agent.get(url)
    @data
  end
  attr_accessor :url, :uuap_url, :agent, :data

  def latest
    @agent.get(url)
    latest_date = agent.page.search('a')[1].inner_text
    latest_date[4] = "-"
    latest_date[7] = "-"
    latest_date[10] = ""

    latest_title = agent.page.at('h2').inner_text[15..-1]

    latest_body = agent.page.search('p')[0].inner_text[2..-1]
    
    @data = { :date => latest_date, :title => latest_title, :body => latest_body}
  end

  def has_new_diary
    @data != latest
  end

  def access_edit_display
    uuap_url = "http://uuap.src.ricoh.co.jp/index.php?cmd=edit&page=%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD%2F" + @data[:date] + "&refer=%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD"
    @agent.get(uuap_url)
    @uuap_url = uuap_url
  end

  def add_body
    p tmp = @agent.page.search("textarea")[1].inner_text
    agent.page.form_with(:action => 'http://uuap.src.ricoh.co.jp/index.php'){|f|
      f.field_with(:name => 'msg').value = tmp + "\n*" + @data[:title] + "-tdiary" + "[/#f7752111]\n" + @data[:body][0..40] + "・・・\n" + @url# + "?date=" + @data[:date][0..3] + @data[:date][5..6] + @data[:date][8..-1]
      f.click_button(f.button_with(:value => "ページの更新"))
    }
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
      yamano.access_edit_display
      yamano.add_body
    end
    sleep 1

  end
end
