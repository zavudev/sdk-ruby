# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class BrandUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Number10dlc::BrandUpdateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :brand_id

        sig { returns(T.nilable(String)) }
        attr_reader :city

        sig { params(city: String).void }
        attr_writer :city

        sig { returns(T.nilable(String)) }
        attr_reader :company_name

        sig { params(company_name: String).void }
        attr_writer :company_name

        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        sig { returns(T.nilable(String)) }
        attr_reader :display_name

        sig { params(display_name: String).void }
        attr_writer :display_name

        sig { returns(T.nilable(String)) }
        attr_reader :ein

        sig { params(ein: String).void }
        attr_writer :ein

        sig { returns(T.nilable(String)) }
        attr_reader :email

        sig { params(email: String).void }
        attr_writer :email

        # Business entity type for 10DLC brand registration.
        sig do
          returns(
            T.nilable(
              Zavudev::Number10dlc::BrandUpdateParams::EntityType::OrSymbol
            )
          )
        end
        attr_reader :entity_type

        sig do
          params(
            entity_type:
              Zavudev::Number10dlc::BrandUpdateParams::EntityType::OrSymbol
          ).void
        end
        attr_writer :entity_type

        sig { returns(T.nilable(String)) }
        attr_reader :first_name

        sig { params(first_name: String).void }
        attr_writer :first_name

        sig { returns(T.nilable(String)) }
        attr_reader :last_name

        sig { params(last_name: String).void }
        attr_writer :last_name

        sig { returns(T.nilable(String)) }
        attr_reader :phone

        sig { params(phone: String).void }
        attr_writer :phone

        sig { returns(T.nilable(String)) }
        attr_reader :postal_code

        sig { params(postal_code: String).void }
        attr_writer :postal_code

        sig { returns(T.nilable(String)) }
        attr_reader :state

        sig { params(state: String).void }
        attr_writer :state

        sig { returns(T.nilable(String)) }
        attr_reader :stock_exchange

        sig { params(stock_exchange: String).void }
        attr_writer :stock_exchange

        sig { returns(T.nilable(String)) }
        attr_reader :stock_symbol

        sig { params(stock_symbol: String).void }
        attr_writer :stock_symbol

        sig { returns(T.nilable(String)) }
        attr_reader :street

        sig { params(street: String).void }
        attr_writer :street

        sig { returns(T.nilable(String)) }
        attr_reader :vertical

        sig { params(vertical: String).void }
        attr_writer :vertical

        sig { returns(T.nilable(String)) }
        attr_reader :website

        sig { params(website: String).void }
        attr_writer :website

        sig do
          params(
            brand_id: String,
            city: String,
            company_name: String,
            country: String,
            display_name: String,
            ein: String,
            email: String,
            entity_type:
              Zavudev::Number10dlc::BrandUpdateParams::EntityType::OrSymbol,
            first_name: String,
            last_name: String,
            phone: String,
            postal_code: String,
            state: String,
            stock_exchange: String,
            stock_symbol: String,
            street: String,
            vertical: String,
            website: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          brand_id:,
          city: nil,
          company_name: nil,
          country: nil,
          display_name: nil,
          ein: nil,
          email: nil,
          # Business entity type for 10DLC brand registration.
          entity_type: nil,
          first_name: nil,
          last_name: nil,
          phone: nil,
          postal_code: nil,
          state: nil,
          stock_exchange: nil,
          stock_symbol: nil,
          street: nil,
          vertical: nil,
          website: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              brand_id: String,
              city: String,
              company_name: String,
              country: String,
              display_name: String,
              ein: String,
              email: String,
              entity_type:
                Zavudev::Number10dlc::BrandUpdateParams::EntityType::OrSymbol,
              first_name: String,
              last_name: String,
              phone: String,
              postal_code: String,
              state: String,
              stock_exchange: String,
              stock_symbol: String,
              street: String,
              vertical: String,
              website: String,
              request_options: Zavudev::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Business entity type for 10DLC brand registration.
        module EntityType
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::Number10dlc::BrandUpdateParams::EntityType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PRIVATE_PROFIT =
            T.let(
              :PRIVATE_PROFIT,
              Zavudev::Number10dlc::BrandUpdateParams::EntityType::TaggedSymbol
            )
          PUBLIC_PROFIT =
            T.let(
              :PUBLIC_PROFIT,
              Zavudev::Number10dlc::BrandUpdateParams::EntityType::TaggedSymbol
            )
          NON_PROFIT =
            T.let(
              :NON_PROFIT,
              Zavudev::Number10dlc::BrandUpdateParams::EntityType::TaggedSymbol
            )
          GOVERNMENT =
            T.let(
              :GOVERNMENT,
              Zavudev::Number10dlc::BrandUpdateParams::EntityType::TaggedSymbol
            )
          SOLE_PROPRIETOR =
            T.let(
              :SOLE_PROPRIETOR,
              Zavudev::Number10dlc::BrandUpdateParams::EntityType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Number10dlc::BrandUpdateParams::EntityType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
