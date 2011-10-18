require 'twitter/base'
require 'twitter/geo_factory'

module Twitter
  class Place < Twitter::Base
    attr_reader :attributes, :bounding_box, :country, :country_code,
      :full_name, :id, :name, :place_type, :parent_id, :url, :woeid

    def initialize(place={})
      if bounding_box = place.delete('bounding_box')
        @bounding_box = Twitter::GeoFactory.new(bounding_box)
      end
      @country_code = place.delete('country_code') || place.delete('countryCode')
      @place_type = place.delete('place_type') || place['placeType'] && place['placeType'].delete('name')
      super(place)
    end

    def ==(other)
      super || (other.class == self.class && other.instance_variable_get('@id'.to_sym) == @id)
    end

  end
end
