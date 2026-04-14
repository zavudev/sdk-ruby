# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class TenDlcBrand < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Number10dlc::TenDlcBrand, Zavudev::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :city

        # Two-letter ISO country code.
        sig { returns(String) }
        attr_accessor :country

        sig { returns(Time) }
        attr_accessor :created_at

        # Display name of the brand.
        sig { returns(String) }
        attr_accessor :display_name

        sig { returns(String) }
        attr_accessor :email

        # Business entity type for 10DLC brand registration.
        sig do
          returns(Zavudev::Number10dlc::TenDlcBrand::EntityType::TaggedSymbol)
        end
        attr_accessor :entity_type

        # Contact phone number in E.164 format.
        sig { returns(String) }
        attr_accessor :phone

        sig { returns(String) }
        attr_accessor :postal_code

        sig { returns(String) }
        attr_accessor :state

        # Status of a 10DLC brand registration.
        sig { returns(Zavudev::Number10dlc::TenDlcBrand::Status::TaggedSymbol) }
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :street

        sig { returns(Time) }
        attr_accessor :updated_at

        # Industry vertical.
        sig { returns(String) }
        attr_accessor :vertical

        sig { returns(T.nilable(String)) }
        attr_accessor :brand_relationship

        # Trust score assigned by TCR after vetting.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :brand_score

        # Legal company name.
        sig { returns(T.nilable(String)) }
        attr_accessor :company_name

        # Employer Identification Number (EIN).
        sig { returns(T.nilable(String)) }
        attr_accessor :ein

        # Reason for rejection, if applicable.
        sig { returns(T.nilable(String)) }
        attr_accessor :failure_reason

        sig { returns(T.nilable(String)) }
        attr_accessor :first_name

        sig { returns(T.nilable(String)) }
        attr_accessor :last_name

        sig { returns(T.nilable(String)) }
        attr_accessor :stock_exchange

        sig { returns(T.nilable(String)) }
        attr_accessor :stock_symbol

        sig { returns(T.nilable(Time)) }
        attr_accessor :submitted_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :verified_at

        sig { returns(T.nilable(String)) }
        attr_accessor :website

        sig do
          params(
            id: String,
            city: String,
            country: String,
            created_at: Time,
            display_name: String,
            email: String,
            entity_type:
              Zavudev::Number10dlc::TenDlcBrand::EntityType::OrSymbol,
            phone: String,
            postal_code: String,
            state: String,
            status: Zavudev::Number10dlc::TenDlcBrand::Status::OrSymbol,
            street: String,
            updated_at: Time,
            vertical: String,
            brand_relationship: T.nilable(String),
            brand_score: T.nilable(Integer),
            company_name: T.nilable(String),
            ein: T.nilable(String),
            failure_reason: T.nilable(String),
            first_name: T.nilable(String),
            last_name: T.nilable(String),
            stock_exchange: T.nilable(String),
            stock_symbol: T.nilable(String),
            submitted_at: T.nilable(Time),
            verified_at: T.nilable(Time),
            website: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          city:,
          # Two-letter ISO country code.
          country:,
          created_at:,
          # Display name of the brand.
          display_name:,
          email:,
          # Business entity type for 10DLC brand registration.
          entity_type:,
          # Contact phone number in E.164 format.
          phone:,
          postal_code:,
          state:,
          # Status of a 10DLC brand registration.
          status:,
          street:,
          updated_at:,
          # Industry vertical.
          vertical:,
          brand_relationship: nil,
          # Trust score assigned by TCR after vetting.
          brand_score: nil,
          # Legal company name.
          company_name: nil,
          # Employer Identification Number (EIN).
          ein: nil,
          # Reason for rejection, if applicable.
          failure_reason: nil,
          first_name: nil,
          last_name: nil,
          stock_exchange: nil,
          stock_symbol: nil,
          submitted_at: nil,
          verified_at: nil,
          website: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              city: String,
              country: String,
              created_at: Time,
              display_name: String,
              email: String,
              entity_type:
                Zavudev::Number10dlc::TenDlcBrand::EntityType::TaggedSymbol,
              phone: String,
              postal_code: String,
              state: String,
              status: Zavudev::Number10dlc::TenDlcBrand::Status::TaggedSymbol,
              street: String,
              updated_at: Time,
              vertical: String,
              brand_relationship: T.nilable(String),
              brand_score: T.nilable(Integer),
              company_name: T.nilable(String),
              ein: T.nilable(String),
              failure_reason: T.nilable(String),
              first_name: T.nilable(String),
              last_name: T.nilable(String),
              stock_exchange: T.nilable(String),
              stock_symbol: T.nilable(String),
              submitted_at: T.nilable(Time),
              verified_at: T.nilable(Time),
              website: T.nilable(String)
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
              T.all(Symbol, Zavudev::Number10dlc::TenDlcBrand::EntityType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PRIVATE_PROFIT =
            T.let(
              :PRIVATE_PROFIT,
              Zavudev::Number10dlc::TenDlcBrand::EntityType::TaggedSymbol
            )
          PUBLIC_PROFIT =
            T.let(
              :PUBLIC_PROFIT,
              Zavudev::Number10dlc::TenDlcBrand::EntityType::TaggedSymbol
            )
          NON_PROFIT =
            T.let(
              :NON_PROFIT,
              Zavudev::Number10dlc::TenDlcBrand::EntityType::TaggedSymbol
            )
          GOVERNMENT =
            T.let(
              :GOVERNMENT,
              Zavudev::Number10dlc::TenDlcBrand::EntityType::TaggedSymbol
            )
          SOLE_PROPRIETOR =
            T.let(
              :SOLE_PROPRIETOR,
              Zavudev::Number10dlc::TenDlcBrand::EntityType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Number10dlc::TenDlcBrand::EntityType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Status of a 10DLC brand registration.
        module Status
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::Number10dlc::TenDlcBrand::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DRAFT =
            T.let(
              :draft,
              Zavudev::Number10dlc::TenDlcBrand::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Zavudev::Number10dlc::TenDlcBrand::Status::TaggedSymbol
            )
          VERIFIED =
            T.let(
              :verified,
              Zavudev::Number10dlc::TenDlcBrand::Status::TaggedSymbol
            )
          REJECTED =
            T.let(
              :rejected,
              Zavudev::Number10dlc::TenDlcBrand::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Zavudev::Number10dlc::TenDlcBrand::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
