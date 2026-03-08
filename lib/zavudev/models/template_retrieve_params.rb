# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Templates#retrieve
    class TemplateRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute template_id
      #
      #   @return [String]
      required :template_id, String

      # @!method initialize(template_id:, request_options: {})
      #   @param template_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
