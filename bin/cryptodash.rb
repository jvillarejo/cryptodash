$:.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib/"))

require 'cryptodash'

cryptodash = Cryptodash.new

puts cryptodash.account.to_hash