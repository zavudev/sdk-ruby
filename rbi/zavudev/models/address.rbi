# typed: strong

module Zavudev
  module Models
    class Address < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::Address, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :country_code

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :locality

      sig { returns(String) }
      attr_accessor :postal_code

      sig { returns(Zavudev::AddressStatus::TaggedSymbol) }
      attr_accessor :status

      sig { returns(String) }
      attr_accessor :street_address

      sig { returns(T.nilable(String)) }
      attr_accessor :administrative_area

      sig { returns(T.nilable(String)) }
      attr_accessor :business_name

      sig { returns(T.nilable(String)) }
      attr_accessor :extended_address

      sig { returns(T.nilable(String)) }
      attr_accessor :first_name

      sig { returns(T.nilable(String)) }
      attr_accessor :last_name

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # A regulatory address for phone number requirements.
      sig do
        params(
          id: String,
          country_code: String,
          created_at: Time,
          locality: String,
          postal_code: String,
          status: Zavudev::AddressStatus::OrSymbol,
          street_address: String,
          administrative_area: T.nilable(String),
          business_name: T.nilable(String),
          extended_address: T.nilable(String),
          first_name: T.nilable(String),
          last_name: T.nilable(String),
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        country_code:,
        created_at:,
        locality:,
        postal_code:,
        status:,
        street_address:,
        administrative_area: nil,
        business_name: nil,
        extended_address: nil,
        first_name: nil,
        last_name: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            country_code: String,
            created_at: Time,
            locality: String,
            postal_code: String,
            status: Zavudev::AddressStatus::TaggedSymbol,
            street_address: String,
            administrative_area: T.nilable(String),
            business_name: T.nilable(String),
            extended_address: T.nilable(String),
            first_name: T.nilable(String),
            last_name: T.nilable(String),
            updated_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
