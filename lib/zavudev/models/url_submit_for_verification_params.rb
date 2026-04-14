# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::URLs#submit_for_verification
    class URLSubmitForVerificationParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute url
      #   The URL to submit for verification.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(url:, request_options: {})
      #   @param url [String] The URL to submit for verification.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
