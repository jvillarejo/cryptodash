require 'json'
require 'uri'
require_relative 'cacheable'
require_relative 'http_requester'

class HTTPRepository
  include Cacheable
  include HTTPRequester

  def initialize(uri)
    @uri = uri
  end

  def get_data
    cache { JSON.parse(get(@uri) ) } 
  end

  def domain_url
    uri.scheme + '://' + uri.host
  end

  private
  def uri
    URI.parse(@uri)
  end

end