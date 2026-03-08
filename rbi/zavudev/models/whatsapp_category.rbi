# typed: strong

module Zavudev
  module Models
    # WhatsApp template category.
    module WhatsappCategory
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::WhatsappCategory) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UTILITY = T.let(:UTILITY, Zavudev::WhatsappCategory::TaggedSymbol)
      MARKETING = T.let(:MARKETING, Zavudev::WhatsappCategory::TaggedSymbol)
      AUTHENTICATION =
        T.let(:AUTHENTICATION, Zavudev::WhatsappCategory::TaggedSymbol)

      sig do
        override.returns(T::Array[Zavudev::WhatsappCategory::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
