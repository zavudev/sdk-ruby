# typed: strong

module Zavudev
  module Resources
    class PhoneNumbers
      # Get details of a specific phone number.
      sig do
        params(
          phone_number_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::PhoneNumberRetrieveResponse)
      end
      def retrieve(phone_number_id, request_options: {})
      end

      # Update a phone number's name or sender assignment.
      sig do
        params(
          phone_number_id: String,
          name: T.nilable(String),
          sender_id: T.nilable(String),
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::PhoneNumberUpdateResponse)
      end
      def update(
        phone_number_id,
        # Custom name for the phone number. Set to null to clear.
        name: nil,
        # Sender ID to assign the phone number to. Set to null to unassign.
        sender_id: nil,
        request_options: {}
      )
      end

      # List all phone numbers owned by this project.
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::PhoneNumberStatus::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::OwnedPhoneNumber])
      end
      def list(
        # Pagination cursor.
        cursor: nil,
        limit: nil,
        # Filter by phone number status.
        status: nil,
        request_options: {}
      )
      end

      # Purchase an available phone number. The first US phone number is free for each
      # team.
      sig do
        params(
          phone_number: String,
          name: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::PhoneNumberPurchaseResponse)
      end
      def purchase(
        # Phone number in E.164 format.
        phone_number:,
        # Optional custom name for the phone number.
        name: nil,
        request_options: {}
      )
      end

      # Release a phone number. The phone number must not be assigned to a sender.
      sig do
        params(
          phone_number_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def release(phone_number_id, request_options: {})
      end

      # Get regulatory requirements for purchasing phone numbers in a specific country.
      # Some countries require additional documentation (addresses, identity documents)
      # before phone numbers can be activated.
      sig do
        params(
          country_code: String,
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::PhoneNumberRequirementsResponse)
      end
      def requirements(
        # Two-letter ISO country code.
        country_code:,
        # Type of phone number (local, mobile, tollFree).
        type: nil,
        request_options: {}
      )
      end

      # Search for available phone numbers to purchase by country and type.
      sig do
        params(
          country_code: String,
          contains: String,
          limit: Integer,
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::PhoneNumberSearchAvailableResponse)
      end
      def search_available(
        # Two-letter ISO country code.
        country_code:,
        # Search for numbers containing this string.
        contains: nil,
        # Maximum number of results to return.
        limit: nil,
        # Type of phone number to search for.
        type: nil,
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
