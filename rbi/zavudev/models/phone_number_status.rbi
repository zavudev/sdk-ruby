# typed: strong

module Zavudev
  module Models
    # Billing state of an owned number, separate from `regulatoryStatus`. `pending` is
    # legacy and is not written to numbers today. The SDKs carry `active`, `suspended`
    # and `pending` only; `releasing` and `released` are returned by the REST API
    # until their next release.
    module PhoneNumberStatus
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::PhoneNumberStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ACTIVE = T.let(:active, Zavudev::PhoneNumberStatus::TaggedSymbol)
      SUSPENDED = T.let(:suspended, Zavudev::PhoneNumberStatus::TaggedSymbol)
      PENDING = T.let(:pending, Zavudev::PhoneNumberStatus::TaggedSymbol)
      RELEASING = T.let(:releasing, Zavudev::PhoneNumberStatus::TaggedSymbol)
      RELEASED = T.let(:released, Zavudev::PhoneNumberStatus::TaggedSymbol)

      sig do
        override.returns(T::Array[Zavudev::PhoneNumberStatus::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
