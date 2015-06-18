require "redis_backend/version"

if ENV['REDIS_SERVER']
  begin
    $redis = Redis.new(:host => ENV['REDIS_SERVER'])
    $redis.auth(ENV['REDIS_AUTH']) if ENV['REDIS_AUTH']
  rescue Redis::CannotConnectError, Redis::TimeoutError
    # unsetted $redis will disable backend support
  end
end

module RedisBackend
  def available?
    true if $redis
  end

  def backend
    yield $redis if available?
  rescue => e
    case e
    when Redis::CommandError
      # TODO: reconnect?
    when Redis::TimeoutError, Redis::CannotConnectError
      # fallback to live request?
    else 
      raise e
    end
  end
end
