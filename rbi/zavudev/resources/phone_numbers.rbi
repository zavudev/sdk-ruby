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
        # Sender ID to assign the phone number to. Set to null to unassign. A number under
        # regulatory review is recorded now and connected to the sender when approved; a
        # rejected number is refused.
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

      # Purchase an available phone number. Requires a paid plan: the Free plan cannot
      # purchase phone numbers and receives `402` with code `paid_plan_required`.
      #
      # **The included number.** A paid plan includes one number at no charge, once per
      # account: it must be a US or Canadian number (a +1 number) costing $20 a month or
      # less. `isFreeEligible` in `GET /v1/phone-numbers/available` marks the numbers
      # that qualify. Claiming it spends the benefit for good, across every team the
      # account owner owns, so releasing that number does not make another one free.
      #
      # **Numbers with regulatory requirements.** Which numbers need regulatory
      # information is decided per number, not by a fixed country list. The purchase
      # looks the requirements up for the exact number before charging anything:
      #
      # 1. `GET /v1/phone-numbers/requirements?phoneNumber=...`. If `items` is empty,
      #    buy normally.
      # 2. Create what it asks for: addresses with `POST /v1/addresses`, documents with
      #    `POST /v1/documents`.
      # 3. Purchase with `type` and `regulatoryRequirements`. The number is bought and
      #    billed at once with `regulatoryStatus: pending_review`.
      # 4. Poll `GET /v1/phone-numbers/{phoneNumberId}` until `regulatoryStatus` is
      #    `approved`. Assign it to a sender before or after approval; it starts
      #    carrying messages once approved.
      #
      # **Reuse.** Information you submitted is kept for your project, per country and
      # `type`, and a later purchase there may omit `regulatoryRequirements`. Reuse only
      # happens when what is kept still covers every requirement of the new number and
      # every address and document in it belongs to the project. Otherwise, or when
      # nothing is kept, the purchase returns `400 regulatory_compliance_required` with
      # the missing requirements in `details`.
      #
      # Invalid values (a missing, unknown or repeated requirement id, an address or
      # document from another project, or one rejected in review) return
      # `400 invalid_request`. If an address or document cannot be registered for
      # review, the purchase returns `400 invalid_request` naming the requirement. If
      # the requirements cannot be looked up, the purchase returns
      # `502 requirements_unavailable`, except for US and Canadian numbers, which are
      # sold as numbers without requirements. None of these errors charge anything.
      sig do
        params(
          phone_number: String,
          name: String,
          regulatory_requirements:
            T::Array[
              Zavudev::PhoneNumberPurchaseParams::RegulatoryRequirement::OrHash
            ],
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::PhoneNumberPurchaseResponse)
      end
      def purchase(
        # Phone number in E.164 format.
        phone_number:,
        # Optional custom name for the phone number.
        name: nil,
        # Regulatory information, for numbers whose requirements list is not empty. Get
        # the list with `GET /v1/phone-numbers/requirements?phoneNumber=...` and send one
        # entry per requirement id, except `action` requirements, which take no value.
        # Every required id must be present, once, and no unknown id may be sent;
        # otherwise the purchase is refused with `400 invalid_request` before anything is
        # charged.
        #
        # The information is kept for your project under the number's country and `type`.
        # A later purchase there may omit this field if what is kept still covers that
        # number's requirements. Omit it for numbers without requirements.
        regulatory_requirements: nil,
        # Type of phone number. `mobile` is stocked in countries where no geographic
        # (`local`) or non-geographic (`national`) inventory exists, and in several
        # markets it is the only type that can receive SMS.
        type: nil,
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

      # Get the regulatory information needed to buy a phone number, for one specific
      # number or for a country and number type. Prefer `phoneNumber`: the response is
      # then exactly the list the purchase of that number validates against. Pass each
      # `requirementTypes[].id` back as `requirementType` in `regulatoryRequirements` on
      # `POST /v1/phone-numbers`.
      #
      # For `phoneNumber`, the requirements of that exact number are returned. When they
      # cannot be resolved for the number itself, the list for its country and `type` is
      # returned instead, and the purchase uses the same list. An empty `items` array
      # means the number needs no regulatory information. If the requirements cannot be
      # retrieved at all, the response is `502 requirements_unavailable`, never an empty
      # list.
      #
      # URL-encode the `+` of `phoneNumber` as `%2B`. An unencoded `+` is also accepted.
      sig do
        params(
          country_code: String,
          phone_number: String,
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::PhoneNumberRequirementsResponse)
      end
      def requirements(
        # Two-letter ISO country code. Required unless `phoneNumber` is given.
        country_code: nil,
        # E.164 number from `GET /v1/phone-numbers/available`, with `+` encoded as `%2B`.
        # Returns the requirements the purchase of that number checks. Takes precedence
        # over `countryCode`.
        phone_number: nil,
        # Type of phone number (local, national, mobile, tollFree). Defaults to `local`.
        # With `phoneNumber`, used only when the number's own requirements cannot be
        # resolved and the country list is returned.
        type: nil,
        request_options: {}
      )
      end

      # Search for available phone numbers to purchase by country and type.
      sig do
        params(
          country_code: String,
          capabilities: String,
          contains: String,
          limit: Integer,
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::PhoneNumberSearchAvailableResponse)
      end
      def search_available(
        # Two-letter ISO country code.
        country_code:,
        # Comma-separated capabilities the number must have: `sms`, `voice`, `mms`.
        # Numbers missing any of them are dropped.
        capabilities: nil,
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
