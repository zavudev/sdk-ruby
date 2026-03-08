# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        module KnowledgeBases
          class DocumentDeleteParams < Zavudev::Internal::Type::BaseModel
            extend Zavudev::Internal::Type::RequestParameters::Converter
            include Zavudev::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Senders::Agent::KnowledgeBases::DocumentDeleteParams,
                  Zavudev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :sender_id

            sig { returns(String) }
            attr_accessor :kb_id

            sig { returns(String) }
            attr_accessor :doc_id

            sig do
              params(
                sender_id: String,
                kb_id: String,
                doc_id: String,
                request_options: Zavudev::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(sender_id:, kb_id:, doc_id:, request_options: {})
            end

            sig do
              override.returns(
                {
                  sender_id: String,
                  kb_id: String,
                  doc_id: String,
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
end
