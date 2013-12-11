require 'scraper'

class BitcoinWisdom

  def initialize
    @scraper = Scraper.new('http://bitcoinwisdom.com/')
  end

  def btc_price
    value = @scraper.get_element_by_id('price')

    value[/(\d+.*\d*)</].to_f
  end

end

