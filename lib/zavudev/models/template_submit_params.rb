# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Templates#submit
    class TemplateSubmitParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute template_id
      #
      #   @return [String]
      required :template_id, String

      # @!attribute sender_id
      #   The sender ID with the WhatsApp Business Account to submit the template to.
      #
      #   @return [String]
      required :sender_id, String, api_name: :senderId

      # @!attribute category
      #   Template category. If not provided, uses the category set on the template.
      #
      #   @return [Symbol, Zavudev::Models::WhatsappCategory, nil]
      optional :category, enum: -> { Zavudev::WhatsappCategory }

      # @!method initialize(template_id:, sender_id:, category: nil, request_options: {})
      #   @param template_id [String]
      #
      #   @param sender_id [String] The sender ID with the WhatsApp Business Account to submit the template to.
      #
      #   @param category [Symbol, Zavudev::Models::WhatsappCategory] Template category. If not provided, uses the category set on the template.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
