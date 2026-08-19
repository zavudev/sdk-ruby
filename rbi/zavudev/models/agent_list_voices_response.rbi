# typed: strong

module Zavudev
  module Models
    class AgentListVoicesResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::AgentListVoicesResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Zavudev::Models::AgentListVoicesResponse::Item]) }
      attr_accessor :items

      # Languages an agent can be pinned to. `auto` follows the caller.
      sig { returns(T::Array[String]) }
      attr_accessor :languages

      # Voices in the catalog, before filtering.
      sig { returns(T.nilable(Integer)) }
      attr_reader :total

      sig { params(total: Integer).void }
      attr_writer :total

      sig do
        params(
          items:
            T::Array[Zavudev::Models::AgentListVoicesResponse::Item::OrHash],
          languages: T::Array[String],
          total: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        items:,
        # Languages an agent can be pinned to. `auto` follows the caller.
        languages:,
        # Voices in the catalog, before filtering.
        total: nil
      )
      end

      sig do
        override.returns(
          {
            items: T::Array[Zavudev::Models::AgentListVoicesResponse::Item],
            languages: T::Array[String],
            total: Integer
          }
        )
      end
      def to_hash
      end

      class Item < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::AgentListVoicesResponse::Item,
              Zavudev::Internal::AnyHash
            )
          end

        # Value for `voice.ttsVoiceId`.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :language

        sig { returns(String) }
        attr_accessor :name

        sig do
          params(id: String, language: String, name: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Value for `voice.ttsVoiceId`.
          id:,
          language:,
          name:
        )
        end

        sig { override.returns({ id: String, language: String, name: String }) }
        def to_hash
        end
      end
    end
  end
end
