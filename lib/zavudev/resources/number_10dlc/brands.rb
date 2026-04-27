# frozen_string_literal: true

module Zavudev
  module Resources
    class Number10dlc
      class Brands
        # Create a 10DLC brand registration. The brand starts in draft status. Submit it
        # for review using the submit endpoint.
        #
        # @overload create(city:, country:, display_name:, email:, entity_type:, phone:, postal_code:, state:, street:, vertical:, company_name: nil, ein: nil, first_name: nil, last_name: nil, stock_exchange: nil, stock_symbol: nil, website: nil, request_options: {})
        #
        # @param city [String]
        #
        # @param country [String] Two-letter ISO country code.
        #
        # @param display_name [String] Display name of the brand.
        #
        # @param email [String]
        #
        # @param entity_type [Symbol, Zavudev::Models::Number10dlc::BrandCreateParams::EntityType] Business entity type for 10DLC brand registration.
        #
        # @param phone [String] Contact phone in E.164 format.
        #
        # @param postal_code [String]
        #
        # @param state [String]
        #
        # @param street [String]
        #
        # @param vertical [String] Industry vertical.
        #
        # @param company_name [String] Legal company name.
        #
        # @param ein [String] Employer Identification Number (format: XX-XXXXXXX).
        #
        # @param first_name [String]
        #
        # @param last_name [String]
        #
        # @param stock_exchange [String]
        #
        # @param stock_symbol [String]
        #
        # @param website [String]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::BrandCreateResponse]
        #
        # @see Zavudev::Models::Number10dlc::BrandCreateParams
        def create(params)
          parsed, options = Zavudev::Number10dlc::BrandCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/10dlc/brands",
            body: parsed,
            model: Zavudev::Models::Number10dlc::BrandCreateResponse,
            options: options
          )
        end

        # Get 10DLC brand
        #
        # @overload retrieve(brand_id, request_options: {})
        #
        # @param brand_id [String] 10DLC brand ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::BrandRetrieveResponse]
        #
        # @see Zavudev::Models::Number10dlc::BrandRetrieveParams
        def retrieve(brand_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/10dlc/brands/%1$s", brand_id],
            model: Zavudev::Models::Number10dlc::BrandRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Update a 10DLC brand in draft status. Cannot update after submission.
        #
        # @overload update(brand_id, city: nil, company_name: nil, country: nil, display_name: nil, ein: nil, email: nil, entity_type: nil, first_name: nil, last_name: nil, phone: nil, postal_code: nil, state: nil, stock_exchange: nil, stock_symbol: nil, street: nil, vertical: nil, website: nil, request_options: {})
        #
        # @param brand_id [String] 10DLC brand ID.
        #
        # @param city [String]
        #
        # @param company_name [String]
        #
        # @param country [String]
        #
        # @param display_name [String]
        #
        # @param ein [String]
        #
        # @param email [String]
        #
        # @param entity_type [Symbol, Zavudev::Models::Number10dlc::BrandUpdateParams::EntityType] Business entity type for 10DLC brand registration.
        #
        # @param first_name [String]
        #
        # @param last_name [String]
        #
        # @param phone [String]
        #
        # @param postal_code [String]
        #
        # @param state [String]
        #
        # @param stock_exchange [String]
        #
        # @param stock_symbol [String]
        #
        # @param street [String]
        #
        # @param vertical [String]
        #
        # @param website [String]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::BrandUpdateResponse]
        #
        # @see Zavudev::Models::Number10dlc::BrandUpdateParams
        def update(brand_id, params = {})
          parsed, options = Zavudev::Number10dlc::BrandUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["v1/10dlc/brands/%1$s", brand_id],
            body: parsed,
            model: Zavudev::Models::Number10dlc::BrandUpdateResponse,
            options: options
          )
        end

        # List 10DLC brand registrations for this project.
        #
        # @overload list(cursor: nil, limit: nil, request_options: {})
        #
        # @param cursor [String]
        # @param limit [Integer]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Internal::Cursor<Zavudev::Models::Number10dlc::TenDlcBrand>]
        #
        # @see Zavudev::Models::Number10dlc::BrandListParams
        def list(params = {})
          parsed, options = Zavudev::Number10dlc::BrandListParams.dump_request(params)
          query = Zavudev::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "v1/10dlc/brands",
            query: query,
            page: Zavudev::Internal::Cursor,
            model: Zavudev::Number10dlc::TenDlcBrand,
            options: options
          )
        end

        # Delete 10DLC brand
        #
        # @overload delete(brand_id, request_options: {})
        #
        # @param brand_id [String] 10DLC brand ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Number10dlc::BrandDeleteParams
        def delete(brand_id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/10dlc/brands/%1$s", brand_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # List available use cases for 10DLC campaign registration.
        #
        # @overload list_use_cases(request_options: {})
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::BrandListUseCasesResponse]
        #
        # @see Zavudev::Models::Number10dlc::BrandListUseCasesParams
        def list_use_cases(params = {})
          @client.request(
            method: :get,
            path: "v1/10dlc/brands/use-cases",
            model: Zavudev::Models::Number10dlc::BrandListUseCasesResponse,
            options: params[:request_options]
          )
        end

        # Submit a draft brand to The Campaign Registry (TCR) for vetting. The brand must
        # be in draft status. A $35 registration fee is charged from your balance.
        #
        # @overload submit(brand_id, request_options: {})
        #
        # @param brand_id [String] 10DLC brand ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::BrandSubmitResponse]
        #
        # @see Zavudev::Models::Number10dlc::BrandSubmitParams
        def submit(brand_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/10dlc/brands/%1$s/submit", brand_id],
            model: Zavudev::Models::Number10dlc::BrandSubmitResponse,
            options: params[:request_options]
          )
        end

        # Sync the brand status with the registration provider. Use this to check for
        # approval updates after submission.
        #
        # @overload sync_status(brand_id, request_options: {})
        #
        # @param brand_id [String] 10DLC brand ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Number10dlc::BrandSyncStatusResponse]
        #
        # @see Zavudev::Models::Number10dlc::BrandSyncStatusParams
        def sync_status(brand_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/10dlc/brands/%1$s/sync", brand_id],
            model: Zavudev::Models::Number10dlc::BrandSyncStatusResponse,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Zavudev::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
