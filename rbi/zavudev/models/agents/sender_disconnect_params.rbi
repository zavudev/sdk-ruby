# typed: strong

module Zavudev
  module Models
    module Agents
      class SenderDisconnectParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Agents::SenderDisconnectParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :agent_id

        sig { returns(String) }
        attr_accessor :sender_id

        sig do
          params(
            agent_id: String,
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(agent_id:, sender_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              agent_id: String,
              sender_id: String,
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
