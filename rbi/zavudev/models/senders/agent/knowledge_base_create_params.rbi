# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class KnowledgeBaseCreateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::KnowledgeBaseCreateParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(String) }
          attr_accessor :name

          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig do
            params(
              sender_id: String,
              name: String,
              description: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(sender_id:, name:, description: nil, request_options: {})
          end

          sig do
            override.returns(
              {
                sender_id: String,
                name: String,
                description: String,
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
