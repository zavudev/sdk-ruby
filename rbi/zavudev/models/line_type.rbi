# typed: strong

module Zavudev
  module Models
    # Type of phone line.
    module LineType
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::LineType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      MOBILE = T.let(:mobile, Zavudev::LineType::TaggedSymbol)
      LANDLINE = T.let(:landline, Zavudev::LineType::TaggedSymbol)
      VOIP = T.let(:voip, Zavudev::LineType::TaggedSymbol)
      TOLL_FREE = T.let(:toll_free, Zavudev::LineType::TaggedSymbol)
      UNKNOWN = T.let(:unknown, Zavudev::LineType::TaggedSymbol)

      sig { override.returns(T::Array[Zavudev::LineType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
