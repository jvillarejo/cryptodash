require 'json'
require 'chooser_repository'
require 'account'
require 'exchange'
require 'cacheable'
require 'bitcoin_wisdom'
require 'cryptodash_config'

class Cryptodash

  def initialize(config = CryptodashConfig.new)
    @config = config
    @account = Account.new(config.pool_accounts, exchange, bitcoin_wisdom)
  end

  def account
    @account
  end

  def profitable_coins
    chooser.profitables
  end

  def quotes
    @exchange.quotes
  end

  private
  def config
    @config
  end

  def exchange
    @exchange ||= Exchange.new(config.exchange_url)
  end

  def bitcoin_wisdom 
   @bitcoin_wisdom ||= BitcoinWisdom.new
  end

  def chooser
    @chooser ||= ChooserRepository.new
  end
  
end