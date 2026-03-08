# typed: strong

module Zavudev
  module Resources
    class Addresses
      # Create a regulatory address for phone number purchases. Some countries require a
      # verified address before phone numbers can be activated.
      sig do
        params(
          country_code: String,
          locality: String,
          postal_code: String,
          street_address: String,
          administrative_area: String,
          business_name: String,
          extended_address: String,
          first_name: String,
          last_name: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::AddressCreateResponse)
      end
      def create(
        country_code:,
        locality:,
        postal_code:,
        street_address:,
        administrative_area: nil,
        business_name: nil,
        extended_address: nil,
        first_name: nil,
        last_name: nil,
        request_options: {}
      )
      end

      # Get a specific regulatory address.
      sig do
        params(
          address_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::AddressRetrieveResponse)
      end
      def retrieve(address_id, request_options: {})
      end

      # List regulatory addresses for this project.
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Address])
      end
      def list(cursor: nil, limit: nil, request_options: {})
      end

      # Delete a regulatory address. Cannot delete addresses that are in use.
      sig do
        params(
          address_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def delete(address_id, request_options: {})
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
