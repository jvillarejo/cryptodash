$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib"))

require 'cutest'
require 'scraper'

setup do 
  Scraper.new('http://bitcoinwisdom.com/')
end

REGEX=/(\d+.*\d*)</

test '#get_element_by_id must retrieve element with id' do |scraper|
  value = scraper.get_element_by_id('price')

  assert value.match(REGEX)
end