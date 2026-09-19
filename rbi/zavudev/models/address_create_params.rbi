# typed: strong

module Zavudev
  module Models
    class AddressCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::AddressCreateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :country_code

      # First name of the person the address is registered to.
      sig { returns(String) }
      attr_accessor :first_name

      # Last name of the person the address is registered to.
      sig { returns(String) }
      attr_accessor :last_name

      sig { returns(String) }
      attr_accessor :locality

      sig { returns(String) }
      attr_accessor :postal_code

      sig { returns(String) }
      attr_accessor :street_address

      sig { returns(T.nilable(String)) }
      attr_reader :administrative_area

      sig { params(administrative_area: String).void }
      attr_writer :administrative_area

      # Business name, when the address belongs to a business. Defaults to the person's
      # full name.
      sig { returns(T.nilable(String)) }
      attr_reader :business_name

      sig { params(business_name: String).void }
      attr_writer :business_name

      sig { returns(T.nilable(String)) }
      attr_reader :extended_address

      sig { params(extended_address: String).void }
      attr_writer :extended_address

      sig do
        params(
          country_code: String,
          first_name: String,
          last_name: String,
          locality: String,
          postal_code: String,
          street_address: String,
          administrative_area: String,
          business_name: String,
          extended_address: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        country_code:,
        # First name of the person the address is registered to.
        first_name:,
        # Last name of the person the address is registered to.
        last_name:,
        locality:,
        postal_code:,
        street_address:,
        administrative_area: nil,
        # Business name, when the address belongs to a business. Defaults to the person's
        # full name.
        business_name: nil,
        extended_address: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            first_name: String,
            last_name: String,
            locality: String,
            postal_code: String,
            street_address: String,
            administrative_area: String,
            business_name: String,
            extended_address: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
