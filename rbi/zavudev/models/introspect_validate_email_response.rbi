# typed: strong

module Zavudev
  module Models
    class IntrospectValidateEmailResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::IntrospectValidateEmailResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # One result per submitted address, in the same order.
      sig do
        returns(
          T::Array[Zavudev::Models::IntrospectValidateEmailResponse::Result]
        )
      end
      attr_accessor :results

      sig { returns(Zavudev::Models::IntrospectValidateEmailResponse::Summary) }
      attr_reader :summary

      sig do
        params(
          summary:
            Zavudev::Models::IntrospectValidateEmailResponse::Summary::OrHash
        ).void
      end
      attr_writer :summary

      sig do
        params(
          results:
            T::Array[
              Zavudev::Models::IntrospectValidateEmailResponse::Result::OrHash
            ],
          summary:
            Zavudev::Models::IntrospectValidateEmailResponse::Summary::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # One result per submitted address, in the same order.
        results:,
        summary:
      )
      end

      sig do
        override.returns(
          {
            results:
              T::Array[
                Zavudev::Models::IntrospectValidateEmailResponse::Result
              ],
            summary: Zavudev::Models::IntrospectValidateEmailResponse::Summary
          }
        )
      end
      def to_hash
      end

      class Result < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::IntrospectValidateEmailResponse::Result,
              Zavudev::Internal::AnyHash
            )
          end

        # Domain part of the address. Null when the syntax is invalid.
        sig { returns(T.nilable(String)) }
        attr_accessor :domain

        # The address exactly as submitted.
        sig { returns(String) }
        attr_accessor :email

        # Lowercased, trimmed form of the address. Null when the syntax is invalid.
        sig { returns(T.nilable(String)) }
        attr_accessor :normalized

        # Signals behind the verdict. Empty for a clean `deliverable` address.
        sig do
          returns(
            T::Array[
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            ]
          )
        end
        attr_accessor :reasons

        # Validation verdict.
        #
        # - `deliverable`: nothing suggests the address will bounce.
        # - `risky`: sendable, but a signal predicts elevated bounce/complaint odds (role
        #   address, disposable domain, MX-less domain, prior soft bounce).
        # - `undeliverable`: will bounce or is blocked (invalid syntax, dead domain, or
        #   the address is on your suppression list after a hard bounce/complaint).
        sig do
          returns(
            Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict::TaggedSymbol
          )
        end
        attr_accessor :verdict

        sig do
          params(
            domain: T.nilable(String),
            email: String,
            normalized: T.nilable(String),
            reasons:
              T::Array[
                Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::OrSymbol
              ],
            verdict:
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Domain part of the address. Null when the syntax is invalid.
          domain:,
          # The address exactly as submitted.
          email:,
          # Lowercased, trimmed form of the address. Null when the syntax is invalid.
          normalized:,
          # Signals behind the verdict. Empty for a clean `deliverable` address.
          reasons:,
          # Validation verdict.
          #
          # - `deliverable`: nothing suggests the address will bounce.
          # - `risky`: sendable, but a signal predicts elevated bounce/complaint odds (role
          #   address, disposable domain, MX-less domain, prior soft bounce).
          # - `undeliverable`: will bounce or is blocked (invalid syntax, dead domain, or
          #   the address is on your suppression list after a hard bounce/complaint).
          verdict:
        )
        end

        sig do
          override.returns(
            {
              domain: T.nilable(String),
              email: String,
              normalized: T.nilable(String),
              reasons:
                T::Array[
                  Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
                ],
              verdict:
                Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Reason
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_SYNTAX =
            T.let(
              :invalid_syntax,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          DOMAIN_NOT_FOUND =
            T.let(
              :domain_not_found,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          DOMAIN_NO_MX =
            T.let(
              :domain_no_mx,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          DISPOSABLE_DOMAIN =
            T.let(
              :disposable_domain,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          ROLE_ADDRESS =
            T.let(
              :role_address,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          SUPPRESSED_HARD_BOUNCE =
            T.let(
              :suppressed_hard_bounce,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          SUPPRESSED_SOFT_BOUNCE =
            T.let(
              :suppressed_soft_bounce,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          SUPPRESSED_COMPLAINT =
            T.let(
              :suppressed_complaint,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          SUPPRESSED_MANUAL =
            T.let(
              :suppressed_manual,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )
          SUPPRESSED_UNSUBSCRIBE =
            T.let(
              :suppressed_unsubscribe,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Validation verdict.
        #
        # - `deliverable`: nothing suggests the address will bounce.
        # - `risky`: sendable, but a signal predicts elevated bounce/complaint odds (role
        #   address, disposable domain, MX-less domain, prior soft bounce).
        # - `undeliverable`: will bounce or is blocked (invalid syntax, dead domain, or
        #   the address is on your suppression list after a hard bounce/complaint).
        module Verdict
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DELIVERABLE =
            T.let(
              :deliverable,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict::TaggedSymbol
            )
          RISKY =
            T.let(
              :risky,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict::TaggedSymbol
            )
          UNDELIVERABLE =
            T.let(
              :undeliverable,
              Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Summary < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::IntrospectValidateEmailResponse::Summary,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :deliverable

        sig { returns(Integer) }
        attr_accessor :risky

        sig { returns(Integer) }
        attr_accessor :total

        sig { returns(Integer) }
        attr_accessor :undeliverable

        sig do
          params(
            deliverable: Integer,
            risky: Integer,
            total: Integer,
            undeliverable: Integer
          ).returns(T.attached_class)
        end
        def self.new(deliverable:, risky:, total:, undeliverable:)
        end

        sig do
          override.returns(
            {
              deliverable: Integer,
              risky: Integer,
              total: Integer,
              undeliverable: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
