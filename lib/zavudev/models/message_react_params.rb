# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Messages#react
    class MessageReactParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute message_id
      #
      #   @return [String]
      required :message_id, String

      # @!attribute emoji
      #   Single emoji character to react with.
      #
      #   @return [String]
      required :emoji, String

      # @!attribute zavu_sender
      #
      #   @return [String, nil]
      optional :zavu_sender, String

      # @!method initialize(message_id:, emoji:, zavu_sender: nil, request_options: {})
      #   @param message_id [String]
      #
      #   @param emoji [String] Single emoji character to react with.
      #
      #   @param zavu_sender [String]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
