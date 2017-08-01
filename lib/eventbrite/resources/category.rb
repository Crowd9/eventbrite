module Eventbrite
  class Category < APIResource
    def self.url
      "/categories"
    end

    def self.all(params={}, token=nil, timeout_opts={})
      response, token = Eventbrite.request(:get, url, token, timeout_opts, params)
      Util.convert_to_eventbrite_object(response, token)
    end
  end
end
