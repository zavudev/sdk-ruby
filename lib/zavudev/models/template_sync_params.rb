# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Templates#sync
    class TemplateSyncParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute sender_id
      #   Sync only the WhatsApp Business Account attached to this sender. If omitted,
      #   every WhatsApp sender in the project is synced.
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId

      # @!method initialize(sender_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::TemplateSyncParams} for more details.
      #
      #   @param sender_id [String] Sync only the WhatsApp Business Account attached to this sender. If omitted, eve
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
