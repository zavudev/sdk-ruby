# typed: strong

module Zavudev
  module Resources
    class Addresses
      # Create a regulatory address, to use as the value of an `address` requirement
      # when buying a phone number. It is registered for review when it is created, with
      # status `pending`.
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
        ).returns(Zavudev::Models::AddressCreateResponse)
      end
      def create(
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

      # Delete a regulatory address from this project. Any address can be deleted,
      # whatever its status. Phone numbers already purchased with it are not affected,
      # and neither is information already submitted for later purchases in its country.
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
