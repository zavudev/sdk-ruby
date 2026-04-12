# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolCreateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::ToolCreateParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(String) }
          attr_accessor :description

          sig { returns(String) }
          attr_accessor :name

          sig { returns(Zavudev::Senders::Agent::ToolParameters) }
          attr_reader :parameters

          sig do
            params(
              parameters: Zavudev::Senders::Agent::ToolParameters::OrHash
            ).void
          end
          attr_writer :parameters

          # Must be HTTPS.
          sig { returns(String) }
          attr_accessor :webhook_url

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enabled

          sig { params(enabled: T::Boolean).void }
          attr_writer :enabled

          # Optional secret for webhook signature verification.
          sig { returns(T.nilable(String)) }
          attr_reader :webhook_secret

          sig { params(webhook_secret: String).void }
          attr_writer :webhook_secret

          sig do
            params(
              sender_id: String,
              description: String,
              name: String,
              parameters: Zavudev::Senders::Agent::ToolParameters::OrHash,
              webhook_url: String,
              enabled: T::Boolean,
              webhook_secret: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            sender_id:,
            description:,
            name:,
            parameters:,
            # Must be HTTPS.
            webhook_url:,
            enabled: nil,
            # Optional secret for webhook signature verification.
            webhook_secret: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                sender_id: String,
                description: String,
                name: String,
                parameters: Zavudev::Senders::Agent::ToolParameters,
                webhook_url: String,
                enabled: T::Boolean,
                webhook_secret: String,
                request_options: Zavudev::RequestOptions
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
