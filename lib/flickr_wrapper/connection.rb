module FlickrWrapper
  class Connection
    class << self
      def create_new_connection(&block)
        Faraday.new(url: base_uri) do |faraday|
          faraday.adapter Faraday.default_adapter
          faraday.request :json
          faraday.response :json, :content_type => /\bjson$/
          block.to_proc.call(faraday) if block
        end
      end

      def parse_response(response, fallback={})
        data = response.body
        begin
          !!JSON.parse(data)
          JSON.parse data
        rescue
          if data.is_a?(Array)
            data.map { |item| map_response_item_to_model(item) }
          else
            map_response_item_to_model(data)
          end
        end
      end

      def data_model
        nil
      end

      def map_response_item_to_model(item)
        return item if item.blank? || data_model.blank?
        data_model.new(item)
      end
    end
  end
end
