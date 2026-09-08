# typed: strong

module Zavudev
  module Resources
    class Templates
      # Create a WhatsApp message template. Note: Templates must be approved by Meta
      # before use.
      sig do
        params(
          body: String,
          language: String,
          name: String,
          add_security_recommendation: T::Boolean,
          buttons: T::Array[Zavudev::TemplateCreateParams::Button::OrHash],
          code_expiration_minutes: Integer,
          footer: String,
          header_content: String,
          header_type: Zavudev::TemplateCreateParams::HeaderType::OrSymbol,
          instagram_body: String,
          sms_body: String,
          telegram_body: String,
          variables: T::Array[String],
          whatsapp_category: Zavudev::WhatsappCategory::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Template)
      end
      def create(
        # Default template body. Used when no channel-specific body is set.
        body:,
        language:,
        name:,
        # Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
        add_security_recommendation: nil,
        # Template buttons (max 3).
        buttons: nil,
        # Code expiration time in minutes. Only for AUTHENTICATION templates.
        code_expiration_minutes: nil,
        # Footer text for the template.
        footer: nil,
        # Header content (text string or media URL).
        header_content: nil,
        # Type of header for the template.
        header_type: nil,
        # Channel-specific body for Instagram. Falls back to `body` if not set.
        instagram_body: nil,
        # Channel-specific body for SMS. Falls back to `body` if not set.
        sms_body: nil,
        # Channel-specific body for Telegram. Falls back to `body` if not set.
        telegram_body: nil,
        variables: nil,
        # WhatsApp template category.
        whatsapp_category: nil,
        request_options: {}
      )
      end

      # Get template
      sig do
        params(
          template_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Template)
      end
      def retrieve(template_id, request_options: {})
      end

      # List WhatsApp message templates for this project.
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Template])
      end
      def list(cursor: nil, limit: nil, request_options: {})
      end

      # Delete template
      sig do
        params(
          template_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def delete(template_id, request_options: {})
      end

      # Submit a WhatsApp template to Meta for approval. The template must be in draft
      # status and associated with a sender that has a WhatsApp Business Account
      # configured.
      sig do
        params(
          template_id: String,
          sender_id: String,
          category: Zavudev::WhatsappCategory::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Template)
      end
      def submit(
        template_id,
        # The sender ID with the WhatsApp Business Account to submit the template to.
        sender_id:,
        # Template category. If not provided, uses the category set on the template.
        category: nil,
        request_options: {}
      )
      end

      # Reconcile this project's templates against WhatsApp. Two things happen per
      # connected WhatsApp Business Account: templates that exist on Meta but not in
      # Zavu are imported (or linked to an existing template with the same name), and
      # the approval status of the templates Zavu already knows about is refreshed from
      # Meta.
      #
      # This is what to call when a template was created outside Zavu — in Meta Business
      # Manager, or by another tool — or when a `template.status_changed` webhook was
      # missed and a template is stuck in `pending`. Status changes normally arrive by
      # webhook; this endpoint is the recovery path and the only path for a template
      # Zavu never created.
      #
      # Templates that Meta reports as rejected or disabled are not imported; they are
      # counted in `skipped`. Existing local templates are matched first by Meta
      # template ID, then by name.
      #
      # By default every sender in the project with a WhatsApp Business Account is
      # synced. Pass `senderId` to sync only that sender's account. The call is
      # synchronous — it waits for Meta and returns what changed — so it can take a few
      # seconds per account. A failure on one account does not fail the request: it is
      # reported in `errors` and the remaining accounts are still synced.
      sig do
        params(
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::TemplateSyncResponse)
      end
      def sync(
        # Sync only the WhatsApp Business Account attached to this sender. If omitted,
        # every WhatsApp sender in the project is synced.
        sender_id: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
