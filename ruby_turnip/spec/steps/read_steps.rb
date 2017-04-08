# coding: utf-8

require 'pages/hash_tag_page'

step "facebookで :word を検索" do |word|
  @hash_tag_page = HashTagPage.new(@driver)
  @hash_tag_page.search(word)
end

step "結果を出力" do
  @hash_tag_page.scraper
end
