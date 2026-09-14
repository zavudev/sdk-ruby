# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Agents#list_voices
    class AgentListVoicesResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Zavudev::Models::AgentListVoicesResponse::Item>]
      required :items, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::AgentListVoicesResponse::Item] }

      # @!attribute languages
      #   Languages an agent can be pinned to. `auto` follows the caller.
      #
      #   @return [Array<String>]
      required :languages, Zavudev::Internal::Type::ArrayOf[String]

      # @!attribute total
      #   Voices in the catalog, before filtering.
      #
      #   @return [Integer, nil]
      optional :total, Integer

      # @!method initialize(items:, languages:, total: nil)
      #   @param items [Array<Zavudev::Models::AgentListVoicesResponse::Item>]
      #
      #   @param languages [Array<String>] Languages an agent can be pinned to. `auto` follows the caller.
      #
      #   @param total [Integer] Voices in the catalog, before filtering.

      class Item < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #   Value for `voice.ttsVoiceId`.
        #
        #   @return [String]
        required :id, String

        # @!attribute language
        #
        #   @return [String]
        required :language, String

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!method initialize(id:, language:, name:)
        #   @param id [String] Value for `voice.ttsVoiceId`.
        #
        #   @param language [String]
        #
        #   @param name [String]
      end
    end
  end
end
