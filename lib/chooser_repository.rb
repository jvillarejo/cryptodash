require_relative 'http_repository'

class ChooserRepository
  def initialize
    @data_source = HTTPRepository.new('http://www.coinchoose.com/api.php?base=LTC')
  end

  def find_all
    @data_source.get_data
  end

  def scrypt_coins
    find_all.select { |coin| coin["algo"] == "scrypt"}
  end

  def profitables
    scrypt_coins.select { |coin| adjusted_ratio(coin) > 100 }.sort { |coin1, coin2| sort(coin1,coin2)}.reverse
  end

  def sort(coin1, coin2)
    adjusted_ratio(coin1) <=> adjusted_ratio(coin2)
  end

  def adjusted_ratio(coin)
    coin["adjustedratio"].to_f
  end
end