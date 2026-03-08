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

          sig do
            returns(
              T.nilable(Zavudev::Senders::Agent::ToolUpdateParams::Parameters)
            )
          end
          attr_reader :parameters

          sig do
            params(
              parameters:
                Zavudev::Senders::Agent::ToolUpdateParams::Parameters::OrHash
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
              parameters:
                Zavudev::Senders::Agent::ToolUpdateParams::Parameters::OrHash,
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
                parameters:
                  Zavudev::Senders::Agent::ToolUpdateParams::Parameters,
                webhook_secret: T.nilable(String),
                webhook_url: String,
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
                  Zavudev::Senders::Agent::ToolUpdateParams::Parameters,
                  Zavudev::Internal::AnyHash
                )
              end

            sig do
              returns(
                T::Hash[
                  Symbol,
                  Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Property
                ]
              )
            end
            attr_accessor :properties

            sig { returns(T::Array[String]) }
            attr_accessor :required

            sig do
              returns(
                Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Type::OrSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                properties:
                  T::Hash[
                    Symbol,
                    Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Property::OrHash
                  ],
                required: T::Array[String],
                type:
                  Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Type::OrSymbol
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
                      Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Property
                    ],
                  required: T::Array[String],
                  type:
                    Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Type::OrSymbol
                }
              )
            end
            def to_hash
            end

            class Property < Zavudev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Property,
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
                    Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              OBJECT =
                T.let(
                  :object,
                  Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Zavudev::Senders::Agent::ToolUpdateParams::Parameters::Type::TaggedSymbol
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
