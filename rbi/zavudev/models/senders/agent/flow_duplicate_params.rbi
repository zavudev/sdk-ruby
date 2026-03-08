# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowDuplicateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::FlowDuplicateParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(String) }
          attr_accessor :flow_id

          sig { returns(String) }
          attr_accessor :new_name

          sig do
            params(
              sender_id: String,
              flow_id: String,
              new_name: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(sender_id:, flow_id:, new_name:, request_options: {})
          end

          sig do
            override.returns(
              {
                sender_id: String,
                flow_id: String,
                new_name: String,
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
