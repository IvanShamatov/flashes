require "nokogiri"
require "open-uri"

doc = Nokogiri::HTML(open("http://www.papahuhu.com/vocabulary/itwords.html"))
u = User.create(email: "admin@example.com", password: 'password', password_confirmation: 'password')

doc.css("tr").each do |tr|
  unless (tr.css("td")[0].nil?) || (tr.css("td")[2].nil?)
    Card.create!( original_text: tr.css("td")[0].content, translated_text: tr.css("td")[2].content, review_date: Date.current, user_id: u.id)
  end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#  Card.create!( original_text: tr.css("span.cn")[0].text, translated_text: tr.css("td")[2].text )
