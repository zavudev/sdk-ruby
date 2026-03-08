# typed: strong

module Zavudev
  module Models
    class AddressRetrieveResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::AddressRetrieveResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # A regulatory address for phone number requirements.
      sig { returns(Zavudev::Address) }
      attr_reader :address

      sig { params(address: Zavudev::Address::OrHash).void }
      attr_writer :address

      sig do
        params(address: Zavudev::Address::OrHash).returns(T.attached_class)
      end
      def self.new(
        # A regulatory address for phone number requirements.
        address:
      )
      end

      sig { override.returns({ address: Zavudev::Address }) }
      def to_hash
      end
    end
  end
end
