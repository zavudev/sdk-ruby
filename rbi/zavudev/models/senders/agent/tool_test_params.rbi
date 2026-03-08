# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolTestParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::ToolTestParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(String) }
          attr_accessor :tool_id

          # Parameters to pass to the tool for testing.
          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_accessor :test_params

          sig do
            params(
              sender_id: String,
              tool_id: String,
              test_params: T::Hash[Symbol, T.anything],
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            sender_id:,
            tool_id:,
            # Parameters to pass to the tool for testing.
            test_params:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                sender_id: String,
                tool_id: String,
                test_params: T::Hash[Symbol, T.anything],
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
