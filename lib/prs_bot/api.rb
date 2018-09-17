module PrsBot
  class API
    attr_reader :client

    def initialize(options={})
      @client = Client.new
    end

    def user_profile(address)
      path = format('api/users/%s', address)
      client.get(path)
    end

    def user_feed(address, options={})
      options = options.with_indifferent_access

      offset = options['offset']
      limit = options['limit']
      type = options['type']
      path = format('api/users/%s/feed.json?offset=%s&limit=%s&type=%s', address, offset.to_s, limit.to_s, type)
      client.get(path)
    end

    def user_subscription(address)
      path = format('api/users/%s/subscription', address)
      client.get(path)
    end

    def filesign(msghash, options={})
      options = options.with_indifferent_access

      rewarders_limit = options['rewarders_limit'] || ''
      with_user = options['with_user'] || true
      path = format('api/filesign/%s?rewardersLimit=%s&withUser=%s', msghash, rewarders_limit, with_user)
      client.get(path)
    end
  end
end
