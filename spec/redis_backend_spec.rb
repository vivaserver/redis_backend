require_relative 'minitest_helper'

describe RedisBackend do
  it 'exists' do
    assert RedisBackend
  end

  if ENV['REDIS_SERVER']
    it 'is available' do
      assert $redis
    end
  else
    it 'is not available' do
      refute $redis
    end
  end
end
