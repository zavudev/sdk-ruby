# typed: strong

module Zavudev
  module Models
    module PhoneNumberStatus
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::PhoneNumberStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ACTIVE = T.let(:active, Zavudev::PhoneNumberStatus::TaggedSymbol)
      SUSPENDED = T.let(:suspended, Zavudev::PhoneNumberStatus::TaggedSymbol)
      PENDING = T.let(:pending, Zavudev::PhoneNumberStatus::TaggedSymbol)

      sig do
        override.returns(T::Array[Zavudev::PhoneNumberStatus::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
