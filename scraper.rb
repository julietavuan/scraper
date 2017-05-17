require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

#De esta manera es como vamos a solicitar la pagina que queremos analizar

#page = HTTParty.get('http://sedici.unlp.edu.ar/handle/10915/60002')
page = HTTParty.get('http://newyork.craigslist.org/search/sss')

#convierte la pagina HTML que seleccionamos y lo convierte en un objeto Nokogiri
parse_page = Nokogiri::HTML(page)

a1 = []

#parse_page.css('view').css('metadata simple-item-view-other').map do |a|
parse_page.css('.content').css('.row').css('.hdrlnk').map do |a|
	post_name = a.text
	a1.push(post_name)
end

Pry.start(binding)