# typed: strong

module Zavudev
  module Models
    # Type of requirement field.
    module RequirementFieldType
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Zavudev::RequirementFieldType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      TEXTUAL = T.let(:textual, Zavudev::RequirementFieldType::TaggedSymbol)
      ADDRESS = T.let(:address, Zavudev::RequirementFieldType::TaggedSymbol)
      DOCUMENT = T.let(:document, Zavudev::RequirementFieldType::TaggedSymbol)
      ACTION = T.let(:action, Zavudev::RequirementFieldType::TaggedSymbol)

      sig do
        override.returns(T::Array[Zavudev::RequirementFieldType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
