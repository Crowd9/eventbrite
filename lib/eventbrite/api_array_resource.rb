module Eventbrite
  class APIArrayResource < APIResource
    def self.all(params={}, token=nil, timeout_opts={})
      unless event_id = params.delete(:event_id)
        raise InvalidRequestError.new('No event_id provided.')
      end

      response, token = Eventbrite.request(:get, self.all_url(event_id), token, timeout_opts, params)
      Util.convert_to_eventbrite_object(response, token)
    end

    private

    def self.all_url(event_id)
      "/events/#{event_id}/#{CGI.escape(class_name.downcase)}s"
    end
  end
end
