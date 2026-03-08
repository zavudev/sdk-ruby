# typed: strong

module Zavudev
  module Models
    module PhoneNumberType
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::PhoneNumberType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      LOCAL = T.let(:local, Zavudev::PhoneNumberType::TaggedSymbol)
      MOBILE = T.let(:mobile, Zavudev::PhoneNumberType::TaggedSymbol)
      TOLL_FREE = T.let(:tollFree, Zavudev::PhoneNumberType::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::PhoneNumberType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
