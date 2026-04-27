# typed: strong

module Zavudev
  module Models
    class URLListVerifiedParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::URLListVerifiedParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter by verification status.
      sig do
        returns(T.nilable(Zavudev::URLListVerifiedParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: Zavudev::URLListVerifiedParams::Status::OrSymbol).void
      end
      attr_writer :status

      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::URLListVerifiedParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        cursor: nil,
        limit: nil,
        # Filter by verification status.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            status: Zavudev::URLListVerifiedParams::Status::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by verification status.
      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::URLListVerifiedParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, Zavudev::URLListVerifiedParams::Status::TaggedSymbol)
        APPROVED =
          T.let(:approved, Zavudev::URLListVerifiedParams::Status::TaggedSymbol)
        REJECTED =
          T.let(:rejected, Zavudev::URLListVerifiedParams::Status::TaggedSymbol)
        MALICIOUS =
          T.let(
            :malicious,
            Zavudev::URLListVerifiedParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::URLListVerifiedParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
