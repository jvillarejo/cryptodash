require 'http_requester'

class Scraper
  include HTTPRequester

  def initialize(url)
    @url = url
  end

  def get_element_by_id(id)
    expression = /<\S*\s*id=\"#{id}\"\s*\S*>\s*\S*<\/\S*>/

    get(@url)[expression]
  end

end