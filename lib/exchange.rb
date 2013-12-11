class Exchange

  def initialize(url)
    @repository = HTTPRepository.new(url)
  end

  def quote_for(from,to)
    if from == to
      Quote.new(from,to,1)
    else
      quotes.find { |quote| quote.from == from && quote.to == to}
    end
  end

  def quotes
    markets.values.map do |value|
      Quote.new(value['primarycode'],value['secondarycode'],value['lasttradeprice'])
    end
  end

  def markets
    data["return"]["markets"]
  end

  private
  def data
    @repository.get_data
  end
end

class Quote
  attr_reader :from, :to, :price
  def initialize(from, to, price)
    @from = from
    @to = to
    @price = price.to_f
  end

  def to_hash
    {
      from: from,
      to: to,
      price: price
    }
  end
end