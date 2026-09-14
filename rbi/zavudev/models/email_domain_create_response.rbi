# typed: strong

module Zavudev
  module Models
    class EmailDomainCreateResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::EmailDomainCreateResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(Zavudev::Models::EmailDomainCreateResponse::Domain) }
      attr_reader :domain

      sig do
        params(
          domain: Zavudev::Models::EmailDomainCreateResponse::Domain::OrHash
        ).void
      end
      attr_writer :domain

      sig do
        params(
          domain: Zavudev::Models::EmailDomainCreateResponse::Domain::OrHash
        ).returns(T.attached_class)
      end
      def self.new(domain:)
      end

      sig do
        override.returns(
          { domain: Zavudev::Models::EmailDomainCreateResponse::Domain }
        )
      end
      def to_hash
      end

      class Domain < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::EmailDomainCreateResponse::Domain,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :dkim_status

        sig { returns(String) }
        attr_accessor :domain

        # Overall verification status.
        sig { returns(String) }
        attr_accessor :status

        # DNS records to publish. Present when fetching a single domain or after adding
        # one.
        sig do
          returns(
            T.nilable(
              T::Array[
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord
              ]
            )
          )
        end
        attr_reader :dns_records

        sig do
          params(
            dns_records:
              T::Array[
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::OrHash
              ]
          ).void
        end
        attr_writer :dns_records

        sig do
          params(
            id: String,
            dkim_status: String,
            domain: String,
            status: String,
            dns_records:
              T::Array[
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          dkim_status:,
          domain:,
          # Overall verification status.
          status:,
          # DNS records to publish. Present when fetching a single domain or after adding
          # one.
          dns_records: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              dkim_status: String,
              domain: String,
              status: String,
              dns_records:
                T::Array[
                  Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord
                ]
            }
          )
        end
        def to_hash
        end

        class DNSRecord < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord,
                Zavudev::Internal::AnyHash
              )
            end

          # Record host/name to create.
          sig { returns(String) }
          attr_accessor :name

          # What the record is for.
          sig do
            returns(
              Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose::TaggedSymbol
            )
          end
          attr_accessor :purpose

          # Whether the record is required to verify + send (DKIM) or recommended for
          # deliverability.
          sig { returns(T::Boolean) }
          attr_accessor :required

          # DNS record type.
          sig { returns(String) }
          attr_accessor :type

          # Record value.
          sig { returns(String) }
          attr_accessor :value

          # Priority (MX records only).
          sig { returns(T.nilable(Integer)) }
          attr_reader :priority

          sig { params(priority: Integer).void }
          attr_writer :priority

          sig do
            params(
              name: String,
              purpose:
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose::OrSymbol,
              required: T::Boolean,
              type: String,
              value: String,
              priority: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Record host/name to create.
            name:,
            # What the record is for.
            purpose:,
            # Whether the record is required to verify + send (DKIM) or recommended for
            # deliverability.
            required:,
            # DNS record type.
            type:,
            # Record value.
            value:,
            # Priority (MX records only).
            priority: nil
          )
          end

          sig do
            override.returns(
              {
                name: String,
                purpose:
                  Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose::TaggedSymbol,
                required: T::Boolean,
                type: String,
                value: String,
                priority: Integer
              }
            )
          end
          def to_hash
          end

          # What the record is for.
          module Purpose
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DKIM =
              T.let(
                :dkim,
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose::TaggedSymbol
              )
            SPF =
              T.let(
                :spf,
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose::TaggedSymbol
              )
            DMARC =
              T.let(
                :dmarc,
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose::TaggedSymbol
              )
            MAIL_FROM =
              T.let(
                :mail_from,
                Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Models::EmailDomainCreateResponse::Domain::DNSRecord::Purpose::TaggedSymbol
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
end
