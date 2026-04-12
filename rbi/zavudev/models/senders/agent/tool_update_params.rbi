# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolUpdateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::ToolUpdateParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(String) }
          attr_accessor :tool_id

          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enabled

          sig { params(enabled: T::Boolean).void }
          attr_writer :enabled

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { returns(T.nilable(Zavudev::Senders::Agent::ToolParameters)) }
          attr_reader :parameters

          sig do
            params(
              parameters: Zavudev::Senders::Agent::ToolParameters::OrHash
            ).void
          end
          attr_writer :parameters

          sig { returns(T.nilable(String)) }
          attr_accessor :webhook_secret

          sig { returns(T.nilable(String)) }
          attr_reader :webhook_url

          sig { params(webhook_url: String).void }
          attr_writer :webhook_url

          sig do
            params(
              sender_id: String,
              tool_id: String,
              description: String,
              enabled: T::Boolean,
              name: String,
              parameters: Zavudev::Senders::Agent::ToolParameters::OrHash,
              webhook_secret: T.nilable(String),
              webhook_url: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            sender_id:,
            tool_id:,
            description: nil,
            enabled: nil,
            name: nil,
            parameters: nil,
            webhook_secret: nil,
            webhook_url: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                sender_id: String,
                tool_id: String,
                description: String,
                enabled: T::Boolean,
                name: String,
                parameters: Zavudev::Senders::Agent::ToolParameters,
                webhook_secret: T.nilable(String),
                webhook_url: String,
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
