# RedisBackend

On the vein of the simplest-possible yet-functional Gem you could possibly release, this is a convenient way to "wrap" your Redis calls on a block that will be gracefully ignored if there is no database connection established yet:

    module Collectable
      extend RedisBackend

      def self.ready_to_collect?
        available?  # $redis global variable holds the Redis DB connection
      end

      def self.all(which)
        backend do |redis|
          redis.smembers(which)
        end
      end
    end

All you need to do is set the environment variables `REDIS_SERVER` and `REDIS_AUTH` (optional) to the host and the password required to execute any command.

## Installation

Add this line to your application's Gemfile:

    gem 'redis_backend'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis_backend

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).

## Copyright

(c)2015 [Cristian R. Arroyo](mailto:cristian.arroyo@vivaserver.com)
