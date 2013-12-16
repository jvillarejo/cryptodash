#Rename this file to cryptodash_config.rb

class CryptodashConfig

  def pool_accounts
    [ 
      { 
        url: "POOL_URL_WITH_API_KEY_ROUTE",
        coin: "COIN_MINING"
      },
      { 
        url: "POOL_URL_WITH_API_KEY_ROUTE",
        coin: "COIN_MINING"
      }

      #You can add more here
    ]
  end

  def exchange_url
    # Now its working only with cryptsy 
    'http://pubapi.cryptsy.com/api.php?method=marketdatav2'
  end
end