# typed: strong

module Zavudev
  module Models
    class BroadcastUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::BroadcastUpdateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :broadcast_id

      # Content for non-text broadcast message types.
      sig { returns(T.nilable(Zavudev::BroadcastContent)) }
      attr_reader :content

      sig { params(content: Zavudev::BroadcastContent::OrHash).void }
      attr_writer :content

      sig { returns(T.nilable(String)) }
      attr_reader :email_html_body

      sig { params(email_html_body: String).void }
      attr_writer :email_html_body

      sig { returns(T.nilable(String)) }
      attr_reader :email_subject

      sig { params(email_subject: String).void }
      attr_writer :email_subject

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      sig do
        params(
          broadcast_id: String,
          content: Zavudev::BroadcastContent::OrHash,
          email_html_body: String,
          email_subject: String,
          metadata: T::Hash[Symbol, String],
          name: String,
          text: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        broadcast_id:,
        # Content for non-text broadcast message types.
        content: nil,
        email_html_body: nil,
        email_subject: nil,
        metadata: nil,
        name: nil,
        text: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            broadcast_id: String,
            content: Zavudev::BroadcastContent,
            email_html_body: String,
            email_subject: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            text: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
