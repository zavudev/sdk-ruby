# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::EmailDomains#retrieve
    class EmailDomainRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute domain
      #
      #   @return [Zavudev::Models::EmailDomainRetrieveResponse::Domain]
      required :domain, -> { Zavudev::Models::EmailDomainRetrieveResponse::Domain }

      # @!method initialize(domain:)
      #   @param domain [Zavudev::Models::EmailDomainRetrieveResponse::Domain]

      # @see Zavudev::Models::EmailDomainRetrieveResponse#domain
      class Domain < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute dkim_status
        #
        #   @return [String]
        required :dkim_status, String, api_name: :dkimStatus

        # @!attribute domain
        #
        #   @return [String]
        required :domain, String

        # @!attribute status
        #   Overall verification status.
        #
        #   @return [String]
        required :status, String

        # @!attribute dns_records
        #   DNS records to publish. Present when fetching a single domain or after adding
        #   one.
        #
        #   @return [Array<Zavudev::Models::EmailDomainRetrieveResponse::Domain::DNSRecord>, nil]
        optional :dns_records,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::EmailDomainRetrieveResponse::Domain::DNSRecord] },
                 api_name: :dnsRecords

        # @!method initialize(id:, dkim_status:, domain:, status:, dns_records: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::EmailDomainRetrieveResponse::Domain} for more details.
        #
        #   @param id [String]
        #
        #   @param dkim_status [String]
        #
        #   @param domain [String]
        #
        #   @param status [String] Overall verification status.
        #
        #   @param dns_records [Array<Zavudev::Models::EmailDomainRetrieveResponse::Domain::DNSRecord>] DNS records to publish. Present when fetching a single domain or after adding on

        class DNSRecord < Zavudev::Internal::Type::BaseModel
          # @!attribute name
          #   Record host/name to create.
          #
          #   @return [String]
          required :name, String

          # @!attribute purpose
          #   What the record is for.
          #
          #   @return [Symbol, Zavudev::Models::EmailDomainRetrieveResponse::Domain::DNSRecord::Purpose]
          required :purpose, enum: -> { Zavudev::Models::EmailDomainRetrieveResponse::Domain::DNSRecord::Purpose }

          # @!attribute required
          #   Whether the record is required to verify + send (DKIM) or recommended for
          #   deliverability.
          #
          #   @return [Boolean]
          required :required, Zavudev::Internal::Type::Boolean

          # @!attribute type
          #   DNS record type.
          #
          #   @return [String]
          required :type, String

          # @!attribute value
          #   Record value.
          #
          #   @return [String]
          required :value, String

          # @!attribute priority
          #   Priority (MX records only).
          #
          #   @return [Integer, nil]
          optional :priority, Integer

          # @!method initialize(name:, purpose:, required:, type:, value:, priority: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::EmailDomainRetrieveResponse::Domain::DNSRecord} for more
          #   details.
          #
          #   @param name [String] Record host/name to create.
          #
          #   @param purpose [Symbol, Zavudev::Models::EmailDomainRetrieveResponse::Domain::DNSRecord::Purpose] What the record is for.
          #
          #   @param required [Boolean] Whether the record is required to verify + send (DKIM) or recommended for delive
          #
          #   @param type [String] DNS record type.
          #
          #   @param value [String] Record value.
          #
          #   @param priority [Integer] Priority (MX records only).

          # What the record is for.
          #
          # @see Zavudev::Models::EmailDomainRetrieveResponse::Domain::DNSRecord#purpose
          module Purpose
            extend Zavudev::Internal::Type::Enum

            DKIM = :dkim
            SPF = :spf
            DMARC = :dmarc
            MAIL_FROM = :mail_from

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
