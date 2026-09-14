# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::URLs#escalate
    class URLEscalateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute url_id
      #
      #   @return [String]
      required :url_id, String

      # @!attribute reason
      #   Why the URL should be reviewed manually.
      #
      #   @return [String]
      required :reason, String

      # @!method initialize(url_id:, reason:, request_options: {})
      #   @param url_id [String]
      #
      #   @param reason [String] Why the URL should be reviewed manually.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
