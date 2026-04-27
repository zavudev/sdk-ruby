# typed: strong

module Zavudev
  module Models
    class SubAccountCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::SubAccountCreateParams, Zavudev::Internal::AnyHash)
        end

      # Name of the sub-account.
      sig { returns(String) }
      attr_accessor :name

      # Spending cap in cents. When reached, messages from this sub-account will be
      # blocked. Omit or set to 0 for no limit.
      sig { returns(T.nilable(Integer)) }
      attr_reader :credit_limit

      sig { params(credit_limit: Integer).void }
      attr_writer :credit_limit

      # External reference ID for your own tracking.
      sig { returns(T.nilable(String)) }
      attr_reader :external_id

      sig { params(external_id: String).void }
      attr_writer :external_id

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.anything]).void }
      attr_writer :metadata

      sig do
        params(
          name: String,
          credit_limit: Integer,
          external_id: String,
          metadata: T::Hash[Symbol, T.anything],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the sub-account.
        name:,
        # Spending cap in cents. When reached, messages from this sub-account will be
        # blocked. Omit or set to 0 for no limit.
        credit_limit: nil,
        # External reference ID for your own tracking.
        external_id: nil,
        metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            credit_limit: Integer,
            external_id: String,
            metadata: T::Hash[Symbol, T.anything],
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
