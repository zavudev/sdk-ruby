# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class BrandCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Number10dlc::BrandCreateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :city

        # Two-letter ISO country code.
        sig { returns(String) }
        attr_accessor :country

        # Display name of the brand.
        sig { returns(String) }
        attr_accessor :display_name

        sig { returns(String) }
        attr_accessor :email

        # Business entity type for 10DLC brand registration.
        sig do
          returns(Zavudev::Number10dlc::BrandCreateParams::EntityType::OrSymbol)
        end
        attr_accessor :entity_type

        # Contact phone in E.164 format.
        sig { returns(String) }
        attr_accessor :phone

        sig { returns(String) }
        attr_accessor :postal_code

        sig { returns(String) }
        attr_accessor :state

        sig { returns(String) }
        attr_accessor :street

        # Industry vertical.
        sig { returns(String) }
        attr_accessor :vertical

        # Legal company name.
        sig { returns(T.nilable(String)) }
        attr_reader :company_name

        sig { params(company_name: String).void }
        attr_writer :company_name

        # Employer Identification Number (format: XX-XXXXXXX).
        sig { returns(T.nilable(String)) }
        attr_reader :ein

        sig { params(ein: String).void }
        attr_writer :ein

        sig { returns(T.nilable(String)) }
        attr_reader :first_name

        sig { params(first_name: String).void }
        attr_writer :first_name

        sig { returns(T.nilable(String)) }
        attr_reader :last_name

        sig { params(last_name: String).void }
        attr_writer :last_name

        sig { returns(T.nilable(String)) }
        attr_reader :stock_exchange

        sig { params(stock_exchange: String).void }
        attr_writer :stock_exchange

        sig { returns(T.nilable(String)) }
        attr_reader :stock_symbol

        sig { params(stock_symbol: String).void }
        attr_writer :stock_symbol

        sig { returns(T.nilable(String)) }
        attr_reader :website

        sig { params(website: String).void }
        attr_writer :website

        sig do
          params(
            city: String,
            country: String,
            display_name: String,
            email: String,
            entity_type:
              Zavudev::Number10dlc::BrandCreateParams::EntityType::OrSymbol,
            phone: String,
            postal_code: String,
            state: String,
            street: String,
            vertical: String,
            company_name: String,
            ein: String,
            first_name: String,
            last_name: String,
            stock_exchange: String,
            stock_symbol: String,
            website: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          city:,
          # Two-letter ISO country code.
          country:,
          # Display name of the brand.
          display_name:,
          email:,
          # Business entity type for 10DLC brand registration.
          entity_type:,
          # Contact phone in E.164 format.
          phone:,
          postal_code:,
          state:,
          street:,
          # Industry vertical.
          vertical:,
          # Legal company name.
          company_name: nil,
          # Employer Identification Number (format: XX-XXXXXXX).
          ein: nil,
          first_name: nil,
          last_name: nil,
          stock_exchange: nil,
          stock_symbol: nil,
          website: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              city: String,
              country: String,
              display_name: String,
              email: String,
              entity_type:
                Zavudev::Number10dlc::BrandCreateParams::EntityType::OrSymbol,
              phone: String,
              postal_code: String,
              state: String,
              street: String,
              vertical: String,
              company_name: String,
              ein: String,
              first_name: String,
              last_name: String,
              stock_exchange: String,
              stock_symbol: String,
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
              T.all(Symbol, Zavudev::Number10dlc::BrandCreateParams::EntityType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PRIVATE_PROFIT =
            T.let(
              :PRIVATE_PROFIT,
              Zavudev::Number10dlc::BrandCreateParams::EntityType::TaggedSymbol
            )
          PUBLIC_PROFIT =
            T.let(
              :PUBLIC_PROFIT,
              Zavudev::Number10dlc::BrandCreateParams::EntityType::TaggedSymbol
            )
          NON_PROFIT =
            T.let(
              :NON_PROFIT,
              Zavudev::Number10dlc::BrandCreateParams::EntityType::TaggedSymbol
            )
          GOVERNMENT =
            T.let(
              :GOVERNMENT,
              Zavudev::Number10dlc::BrandCreateParams::EntityType::TaggedSymbol
            )
          SOLE_PROPRIETOR =
            T.let(
              :SOLE_PROPRIETOR,
              Zavudev::Number10dlc::BrandCreateParams::EntityType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Number10dlc::BrandCreateParams::EntityType::TaggedSymbol
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
