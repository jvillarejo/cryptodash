class Account

  def initialize(pool_accounts, exchange, bitcoin_wisdom)
    @pools = pool_accounts.map do |pool_data| 
      Pool.new(pool_data[:url], pool_data[:coin])
    end

    @exchange = exchange
    @bitcoin_wisdom = bitcoin_wisdom
  end

  def balance
    @pools.map { |pool| pool.to_hash }
  end

  def total_ltc
    @pools.inject(0) do |sum,pool| 
      quote = @exchange.quote_for(pool.coin, 'LTC')
      #mejorar el nil?
      quote.nil? ? sum : sum + (pool.balance * quote.price)
    end
  end

  def total_btc
    total_ltc * @exchange.quote_for("LTC", "BTC").price
  end

  def total_usd
    total_btc * @bitcoin_wisdom.btc_price
  end

  def to_hash
    {
      balance: balance,
      total_ltc: total_ltc,
      total_btc: total_btc,
      total_usd: total_usd
    }
  end
end

class Pool

  attr_reader :coin, :name

  def initialize(url,coin)
    @pool_repository, @coin = HTTPRepository.new(url), coin
    @name = @pool_repository.domain_url
  end

  def balance 
    pool_data['confirmed_rewards'].to_f
  end

  def to_hash
    { 
      :coin => coin,
      :balance => balance,
      :name => name
    }
  end

  def pool_data
    @pool_repository.get_data
  end

end