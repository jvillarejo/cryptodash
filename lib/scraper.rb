require 'http_requester'

require 'nokogiri'

class Scraper
  include HTTPRequester

  def initialize(url)
    @url = url
  end

  def get_element_by_id(id)
    selector = "##{id}"
    doc.css(selector).first.to_html
  end

  def doc
    Nokogiri::HTML(get(@url))
  end
end