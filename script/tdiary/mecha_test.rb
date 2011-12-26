# -*- coding: utf-8 -*-
require 'rubygems'
require 'mechanize'
require 'kconv'

agent = Mechanize.new
#agent.get('http://yamano.nsp.ricoh.co.jp:8000/tdiary/update.rb')
agent.get('http://yamano.nsp.ricoh.co.jp:8000/tdiary/')
agent.get("http://uuap.src.ricoh.co.jp/index.php?cmd=edit&page=%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD%\
2F2011-12-26&refer=%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD")
#agent.get('http://uuap.src.ricoh.co.jp/index.php?%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD')
#p form = agent.page.form_with(:name => 'f1')
p agent.page.title
#agent.page.form_with(:name => 'f'){|form|
#  form.field_with(:name => 'q').value = 'Ruby'
#  form.click_button
#}
#p agent.page.link_with(:text => "ツッコミを入れる".toutf8)

#agent.page.form_with(:action => 'http://uuap.src.ricoh.co.jp/index.php'){|f|
#  f.field_with(:name => 'msg').value = "test"
#  f.click_button(f.button_with(:value => "ページの更新"))
#}

#puts agent.page.at("h2").inner_text
#p "aaaaaaa" + "bbbbbbbbbb"
p a = agent.page.search('textarea')[1].inner_text
#p a = agent.page.search('a')[1].inner_text
#agent.page.search('a')[0..12].each do |p|
#  puts p.inner_text
#end
#puts agent.visited_page('http://yamano.nsp.ricoh.co.jp:8000/tdiary/').uri
#puts agent.page.uri
#puts agent.page.title
#puts agent.page.at('div#logo/img')['alt']

#puts agent.page.at('title').inner_text, agent.page.uri
