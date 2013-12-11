class AccountBalance

  def initialize(pool_accounts)
    @pools = pool_accounts.map do |pool_data| 
      Pool.new(pool_data[:url], pool_data[:coin])
    end
  end

  def balance
    @pools.map { |pool| pool.balance }
  end
end

class Pool

  def initialize(url,coin)
    @pool_repository, @coin = HTTPRepository.new(url), coin
  end

  def balance
    { 
      coin => pool_data['confirmed_rewards']
    }
  end

  def pool_data
    #Make a cache of this
    @pool_repository.get_data
  end

end