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

          sig { returns(Zavudev::Senders::Agent::ToolCreateParams::Parameters) }
          attr_reader :parameters

          sig do
            params(
              parameters:
                Zavudev::Senders::Agent::ToolCreateParams::Parameters::OrHash
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
              parameters:
                Zavudev::Senders::Agent::ToolCreateParams::Parameters::OrHash,
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
                parameters:
                  Zavudev::Senders::Agent::ToolCreateParams::Parameters,
                webhook_url: String,
                enabled: T::Boolean,
                webhook_secret: String,
                request_options: Zavudev::RequestOptions
              }
            )
          end
          def to_hash
          end

          class Parameters < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Senders::Agent::ToolCreateParams::Parameters,
                  Zavudev::Internal::AnyHash
                )
              end

            sig do
              returns(
                T::Hash[
                  Symbol,
                  Zavudev::Senders::Agent::ToolCreateParams::Parameters::Property
                ]
              )
            end
            attr_accessor :properties

            sig { returns(T::Array[String]) }
            attr_accessor :required

            sig do
              returns(
                Zavudev::Senders::Agent::ToolCreateParams::Parameters::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                properties:
                  T::Hash[
                    Symbol,
                    Zavudev::Senders::Agent::ToolCreateParams::Parameters::Property::OrHash
                  ],
                required: T::Array[String],
                type:
                  Zavudev::Senders::Agent::ToolCreateParams::Parameters::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(properties:, required:, type:)
            end

            sig do
              override.returns(
                {
                  properties:
                    T::Hash[
                      Symbol,
                      Zavudev::Senders::Agent::ToolCreateParams::Parameters::Property
                    ],
                  required: T::Array[String],
                  type:
                    Zavudev::Senders::Agent::ToolCreateParams::Parameters::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            class Property < Zavudev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Zavudev::Senders::Agent::ToolCreateParams::Parameters::Property,
                    Zavudev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

              sig { returns(T.nilable(String)) }
              attr_reader :type

              sig { params(type: String).void }
              attr_writer :type

              sig do
                params(description: String, type: String).returns(
                  T.attached_class
                )
              end
              def self.new(description: nil, type: nil)
              end

              sig { override.returns({ description: String, type: String }) }
              def to_hash
              end
            end

            module Type
              extend Zavudev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Zavudev::Senders::Agent::ToolCreateParams::Parameters::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              OBJECT =
                T.let(
                  :object,
                  Zavudev::Senders::Agent::ToolCreateParams::Parameters::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Zavudev::Senders::Agent::ToolCreateParams::Parameters::Type::TaggedSymbol
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
end
