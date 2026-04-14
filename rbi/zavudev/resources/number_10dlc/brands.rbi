# typed: strong

module Zavudev
  module Resources
    class Number10dlc
      class Brands
        # Create a 10DLC brand registration. The brand starts in draft status. Submit it
        # for review using the submit endpoint.
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
          ).returns(Zavudev::Models::Number10dlc::BrandCreateResponse)
        end
        def create(
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

        # Get 10DLC brand
        sig do
          params(
            brand_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Number10dlc::BrandRetrieveResponse)
        end
        def retrieve(
          # 10DLC brand ID.
          brand_id,
          request_options: {}
        )
        end

        # Update a 10DLC brand in draft status. Cannot update after submission.
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
          ).returns(Zavudev::Models::Number10dlc::BrandUpdateResponse)
        end
        def update(
          # 10DLC brand ID.
          brand_id,
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

        # List 10DLC brand registrations for this project.
        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(
            Zavudev::Internal::Cursor[Zavudev::Number10dlc::TenDlcBrand]
          )
        end
        def list(cursor: nil, limit: nil, request_options: {})
        end

        # Delete 10DLC brand
        sig do
          params(
            brand_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def delete(
          # 10DLC brand ID.
          brand_id,
          request_options: {}
        )
        end

        # List available use cases for 10DLC campaign registration.
        sig do
          params(request_options: Zavudev::RequestOptions::OrHash).returns(
            Zavudev::Models::Number10dlc::BrandListUseCasesResponse
          )
        end
        def list_use_cases(request_options: {})
        end

        # Submit a draft brand to The Campaign Registry (TCR) for vetting. The brand must
        # be in draft status. A $35 registration fee is charged from your balance.
        sig do
          params(
            brand_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Number10dlc::BrandSubmitResponse)
        end
        def submit(
          # 10DLC brand ID.
          brand_id,
          request_options: {}
        )
        end

        # Sync the brand status with the registration provider. Use this to check for
        # approval updates after submission.
        sig do
          params(
            brand_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Number10dlc::BrandSyncStatusResponse)
        end
        def sync_status(
          # 10DLC brand ID.
          brand_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Zavudev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
