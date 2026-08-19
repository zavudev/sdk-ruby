# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Conversations#list_messages
    class ConversationListMessagesParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute conversation_id
      #
      #   @return [String]
      required :conversation_id, String

      # @!attribute cursor
      #   Opaque cursor from a previous response's `nextCursor`.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(conversation_id:, cursor: nil, limit: nil, request_options: {})
      #   @param conversation_id [String]
      #
      #   @param cursor [String] Opaque cursor from a previous response's `nextCursor`.
      #
      #   @param limit [Integer]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
