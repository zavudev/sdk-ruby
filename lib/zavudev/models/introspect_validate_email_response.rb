# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Introspect#validate_email
    class IntrospectValidateEmailResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute results
      #   One result per submitted address, in the same order.
      #
      #   @return [Array<Zavudev::Models::IntrospectValidateEmailResponse::Result>]
      required :results,
               -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::IntrospectValidateEmailResponse::Result] }

      # @!attribute summary
      #
      #   @return [Zavudev::Models::IntrospectValidateEmailResponse::Summary]
      required :summary, -> { Zavudev::Models::IntrospectValidateEmailResponse::Summary }

      # @!method initialize(results:, summary:)
      #   @param results [Array<Zavudev::Models::IntrospectValidateEmailResponse::Result>] One result per submitted address, in the same order.
      #
      #   @param summary [Zavudev::Models::IntrospectValidateEmailResponse::Summary]

      class Result < Zavudev::Internal::Type::BaseModel
        # @!attribute domain
        #   Domain part of the address. Null when the syntax is invalid.
        #
        #   @return [String, nil]
        required :domain, String, nil?: true

        # @!attribute email
        #   The address exactly as submitted.
        #
        #   @return [String]
        required :email, String

        # @!attribute normalized
        #   Lowercased, trimmed form of the address. Null when the syntax is invalid.
        #
        #   @return [String, nil]
        required :normalized, String, nil?: true

        # @!attribute reasons
        #   Signals behind the verdict. Empty for a clean `deliverable` address.
        #
        #   @return [Array<Symbol, Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason>]
        required :reasons,
                 -> { Zavudev::Internal::Type::ArrayOf[enum: Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason] }

        # @!attribute verdict
        #   Validation verdict.
        #
        #   - `deliverable`: nothing suggests the address will bounce.
        #   - `risky`: sendable, but a signal predicts elevated bounce/complaint odds (role
        #     address, disposable domain, MX-less domain, prior soft bounce).
        #   - `undeliverable`: will bounce or is blocked (invalid syntax, dead domain, or
        #     the address is on your suppression list after a hard bounce/complaint).
        #
        #   @return [Symbol, Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict]
        required :verdict, enum: -> { Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict }

        # @!method initialize(domain:, email:, normalized:, reasons:, verdict:)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::IntrospectValidateEmailResponse::Result} for more details.
        #
        #   @param domain [String, nil] Domain part of the address. Null when the syntax is invalid.
        #
        #   @param email [String] The address exactly as submitted.
        #
        #   @param normalized [String, nil] Lowercased, trimmed form of the address. Null when the syntax is invalid.
        #
        #   @param reasons [Array<Symbol, Zavudev::Models::IntrospectValidateEmailResponse::Result::Reason>] Signals behind the verdict. Empty for a clean `deliverable` address.
        #
        #   @param verdict [Symbol, Zavudev::Models::IntrospectValidateEmailResponse::Result::Verdict] Validation verdict.

        module Reason
          extend Zavudev::Internal::Type::Enum

          INVALID_SYNTAX = :invalid_syntax
          DOMAIN_NOT_FOUND = :domain_not_found
          DOMAIN_NO_MX = :domain_no_mx
          DISPOSABLE_DOMAIN = :disposable_domain
          ROLE_ADDRESS = :role_address
          SUPPRESSED_HARD_BOUNCE = :suppressed_hard_bounce
          SUPPRESSED_SOFT_BOUNCE = :suppressed_soft_bounce
          SUPPRESSED_COMPLAINT = :suppressed_complaint
          SUPPRESSED_MANUAL = :suppressed_manual
          SUPPRESSED_UNSUBSCRIBE = :suppressed_unsubscribe

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Validation verdict.
        #
        # - `deliverable`: nothing suggests the address will bounce.
        # - `risky`: sendable, but a signal predicts elevated bounce/complaint odds (role
        #   address, disposable domain, MX-less domain, prior soft bounce).
        # - `undeliverable`: will bounce or is blocked (invalid syntax, dead domain, or
        #   the address is on your suppression list after a hard bounce/complaint).
        #
        # @see Zavudev::Models::IntrospectValidateEmailResponse::Result#verdict
        module Verdict
          extend Zavudev::Internal::Type::Enum

          DELIVERABLE = :deliverable
          RISKY = :risky
          UNDELIVERABLE = :undeliverable

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Zavudev::Models::IntrospectValidateEmailResponse#summary
      class Summary < Zavudev::Internal::Type::BaseModel
        # @!attribute deliverable
        #
        #   @return [Integer]
        required :deliverable, Integer

        # @!attribute risky
        #
        #   @return [Integer]
        required :risky, Integer

        # @!attribute total
        #
        #   @return [Integer]
        required :total, Integer

        # @!attribute undeliverable
        #
        #   @return [Integer]
        required :undeliverable, Integer

        # @!method initialize(deliverable:, risky:, total:, undeliverable:)
        #   @param deliverable [Integer]
        #   @param risky [Integer]
        #   @param total [Integer]
        #   @param undeliverable [Integer]
      end
    end
  end
end
