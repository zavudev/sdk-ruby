# typed: strong

module Zavudev
  module Models
    class AgentListVoicesParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::AgentListVoicesParams, Zavudev::Internal::AnyHash)
        end

      # BCP-47 tag (`en`, `es`, `pt-BR`). Omit, or pass `auto`, for every voice.
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      sig do
        params(
          language: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # BCP-47 tag (`en`, `es`, `pt-BR`). Omit, or pass `auto`, for every voice.
        language: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { language: String, request_options: Zavudev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
