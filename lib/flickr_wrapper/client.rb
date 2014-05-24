module FlickrWrapper
  class Client < Connection

    @api_key ||= ""
    @api_secret ||= ""

    def self.base_uri
      "https://api.flickr.com/services/rest"
    end

    def self.default_params
      {
        api_key: api_key,
        format: "json",
        nojsoncallback: "1"
      }
    end

    def self.get_photos tag
      params = {
        method: "flickr.photos.search",
        safe_search: "1",
        tags: tag
      }.merge default_params
      response = connection.get do |req|
        req.params = params
      end
      parse_response response
    end

    class << self
      attr_accessor :api_key, :api_secret

      def connection
        @connection ||= create_new_connection
      end

      def connection_options
        { timeout: 15, open_timeout: 5 }
      end
    end
  end
end
