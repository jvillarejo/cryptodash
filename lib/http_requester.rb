require 'net/http'
require 'uri'

module HTTPRequester
  def get(uri_str, redirection_limit = 5)
    raise ArgumentError, 'HTTP redirect too deep' if redirection_limit == 0

    response = get_response(URI(uri_str))
    
    if response.code == '301'
      get(response['location'], redirection_limit - 1)
    elsif response.code == '200'
      response.body
    else
      raise 'HTTP Error could not get data'
    end
  end

  private
  def get_response(uri)
    Net::HTTP.start(uri.host, uri.port, use_ssl: https?(uri)) do |http|
      request = Net::HTTP::Get.new(uri)
      response = http.request(request)
    end
  end

  def https?(uri)
    uri.scheme == 'https'
  end
end