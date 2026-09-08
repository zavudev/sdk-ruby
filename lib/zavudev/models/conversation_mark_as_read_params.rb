# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Conversations#mark_as_read
    class ConversationMarkAsReadParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute conversation_id
      #
      #   @return [String]
      required :conversation_id, String

      # @!method initialize(conversation_id:, request_options: {})
      #   @param conversation_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
