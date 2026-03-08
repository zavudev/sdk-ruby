# typed: strong

module Zavudev
  module Models
    # Business category for WhatsApp Business profile.
    module WhatsappBusinessProfileVertical
      extend Zavudev::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Zavudev::WhatsappBusinessProfileVertical) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UNDEFINED =
        T.let(
          :UNDEFINED,
          Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol
        )
      OTHER =
        T.let(:OTHER, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      AUTO =
        T.let(:AUTO, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      BEAUTY =
        T.let(:BEAUTY, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      APPAREL =
        T.let(:APPAREL, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      EDU = T.let(:EDU, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      ENTERTAIN =
        T.let(
          :ENTERTAIN,
          Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol
        )
      EVENT_PLAN =
        T.let(
          :EVENT_PLAN,
          Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol
        )
      FINANCE =
        T.let(:FINANCE, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      GROCERY =
        T.let(:GROCERY, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      GOVT =
        T.let(:GOVT, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      HOTEL =
        T.let(:HOTEL, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      HEALTH =
        T.let(:HEALTH, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      NONPROFIT =
        T.let(
          :NONPROFIT,
          Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol
        )
      PROF_SERVICES =
        T.let(
          :PROF_SERVICES,
          Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol
        )
      RETAIL =
        T.let(:RETAIL, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      TRAVEL =
        T.let(:TRAVEL, Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol)
      RESTAURANT =
        T.let(
          :RESTAURANT,
          Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol
        )
      NOT_A_BIZ =
        T.let(
          :NOT_A_BIZ,
          Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[Zavudev::WhatsappBusinessProfileVertical::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
