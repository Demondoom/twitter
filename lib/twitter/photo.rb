require 'twitter/identifiable'
require 'twitter/size'

module Twitter
  class Photo < Twitter::Identifiable
    attr_reader :display_url, :expanded_url, :indices, :media_url,
      :media_url_https, :url

    # @return [Array<Twitter::Size>]
    def sizes
      @sizes ||= Array(@attrs['sizes']).inject({}) do |object, (key, value)|
        object[key] = Twitter::Size.from_response(value)
        object
      end
    end

  end
end
