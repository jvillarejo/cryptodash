$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib"))

require 'cutest'
require 'bitcoin_wisdom'

setup do 
  BitcoinWisdom.new
end

test '#btc_price must be a valid number' do |page|
  assert page.btc_price.is_a?(Float)
end