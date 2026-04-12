# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolParameters < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::ToolParameters,
                Zavudev::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Hash[Symbol, Zavudev::Senders::Agent::ToolParameters::Property]
            )
          end
          attr_accessor :properties

          sig { returns(T::Array[String]) }
          attr_accessor :required

          sig do
            returns(Zavudev::Senders::Agent::ToolParameters::Type::OrSymbol)
          end
          attr_accessor :type

          sig do
            params(
              properties:
                T::Hash[
                  Symbol,
                  Zavudev::Senders::Agent::ToolParameters::Property::OrHash
                ],
              required: T::Array[String],
              type: Zavudev::Senders::Agent::ToolParameters::Type::OrSymbol
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
                    Zavudev::Senders::Agent::ToolParameters::Property
                  ],
                required: T::Array[String],
                type: Zavudev::Senders::Agent::ToolParameters::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          class Property < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Senders::Agent::ToolParameters::Property,
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
                T.all(Symbol, Zavudev::Senders::Agent::ToolParameters::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            OBJECT =
              T.let(
                :object,
                Zavudev::Senders::Agent::ToolParameters::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Senders::Agent::ToolParameters::Type::TaggedSymbol
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
