# typed: strong

module Zavudev
  module Models
    module AddressStatus
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::AddressStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PENDING = T.let(:pending, Zavudev::AddressStatus::TaggedSymbol)
      VERIFIED = T.let(:verified, Zavudev::AddressStatus::TaggedSymbol)
      REJECTED = T.let(:rejected, Zavudev::AddressStatus::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::AddressStatus::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
