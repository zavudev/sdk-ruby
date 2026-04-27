# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::URLs#retrieve_details
    class URLRetrieveDetailsParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute url_id
      #
      #   @return [String]
      required :url_id, String

      # @!method initialize(url_id:, request_options: {})
      #   @param url_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
