require 'open-uri'
require 'rubygems'
require 'nokogiri'

class Scraper

  def self.scrape(web_page)
    page = Nokogiri::HTML(open(web_page))
    count = 1
    page.css('div#content_inner > *').each do |element|
      if element.matches?('h2')
        puts "#{count}. #{element.text} \n\n"
        count += 1
      elsif element.matches?('div.format_text')
        images = element.css('img')
        images.each do |image|
          puts "- #{image['src']} \n\n"
        end
      end
    end
  end
end