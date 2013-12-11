module Cacheable

  def cache(expiration_limit=60, &block)
    current_time = Time.new
    
    if @cached.nil? || ((current_time - last_time) > expiration_limit)
      @last_time = Time.new
      @cached = yield
    else 
      @cached
    end    
  end

  def last_time
    @last_time || Time.new - 70
  end

end