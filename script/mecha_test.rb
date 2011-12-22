# -*- coding: utf-8 -*-
require 'rubygems'
require 'mechanize'
require 'kconv'

agent = Mechanize.new
#agent.get('http://yamano.nsp.ricoh.co.jp:8000/tdiary/update.rb')
agent.get('http://yamano.nsp.ricoh.co.jp:8000/tdiary/')
#agent.get('http://uuap.src.ricoh.co.jp/index.php?%BB%B3%CC%EE%A4%CE%C6%FC%B5%AD')
#p form = agent.page.form_with(:name => 'f1')
#p agent.page
#agent.page.form_with(:name => 'f'){|form|
#  form.field_with(:name => 'q').value = 'Ruby'
#  form.click_button
#}
#p agent.page.link_with(:text => "ツッコミを入れる".toutf8)
#puts agent.page.at('td').inner_text
p a = agent.page.search('a')[1].inner_text
p a = agent.page.search('a')[1].inner_text
#agent.page.search('a')[0..12].each do |p|
#  puts p.inner_text
#end
#puts agent.visited_page('http://yamano.nsp.ricoh.co.jp:8000/tdiary/').uri
#puts agent.page.uri
#puts agent.page.title
#puts agent.page.at('div#logo/img')['alt']

#puts agent.page.at('title').inner_text, agent.page.uri
