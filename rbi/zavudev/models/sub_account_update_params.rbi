# typed: strong

module Zavudev
  module Models
    class SubAccountUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::SubAccountUpdateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.nilable(Integer)) }
      attr_accessor :credit_limit

      sig { returns(T.nilable(String)) }
      attr_reader :external_id

      sig { params(external_id: String).void }
      attr_writer :external_id

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.anything]).void }
      attr_writer :metadata

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig do
        returns(T.nilable(Zavudev::SubAccountUpdateParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: Zavudev::SubAccountUpdateParams::Status::OrSymbol).void
      end
      attr_writer :status

      sig do
        params(
          id: String,
          credit_limit: T.nilable(Integer),
          external_id: String,
          metadata: T::Hash[Symbol, T.anything],
          name: String,
          status: Zavudev::SubAccountUpdateParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        credit_limit: nil,
        external_id: nil,
        metadata: nil,
        name: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            credit_limit: T.nilable(Integer),
            external_id: String,
            metadata: T::Hash[Symbol, T.anything],
            name: String,
            status: Zavudev::SubAccountUpdateParams::Status::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::SubAccountUpdateParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, Zavudev::SubAccountUpdateParams::Status::TaggedSymbol)
        INACTIVE =
          T.let(
            :inactive,
            Zavudev::SubAccountUpdateParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::SubAccountUpdateParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
