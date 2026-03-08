# typed: strong

module Zavudev
  module Models
    class TemplateSubmitParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::TemplateSubmitParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :template_id

      # The sender ID with the WhatsApp Business Account to submit the template to.
      sig { returns(String) }
      attr_accessor :sender_id

      # Template category. If not provided, uses the category set on the template.
      sig { returns(T.nilable(Zavudev::WhatsappCategory::OrSymbol)) }
      attr_reader :category

      sig { params(category: Zavudev::WhatsappCategory::OrSymbol).void }
      attr_writer :category

      sig do
        params(
          template_id: String,
          sender_id: String,
          category: Zavudev::WhatsappCategory::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        template_id:,
        # The sender ID with the WhatsApp Business Account to submit the template to.
        sender_id:,
        # Template category. If not provided, uses the category set on the template.
        category: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            template_id: String,
            sender_id: String,
            category: Zavudev::WhatsappCategory::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
