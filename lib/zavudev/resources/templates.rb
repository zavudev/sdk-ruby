# frozen_string_literal: true

module Zavudev
  module Resources
    class Templates
      # Create a WhatsApp message template. Note: Templates must be approved by Meta
      # before use.
      #
      # @overload create(body:, language:, name:, add_security_recommendation: nil, buttons: nil, code_expiration_minutes: nil, footer: nil, header_content: nil, header_type: nil, instagram_body: nil, sms_body: nil, telegram_body: nil, variables: nil, whatsapp_category: nil, request_options: {})
      #
      # @param body [String] Default template body. Used when no channel-specific body is set.
      #
      # @param language [String]
      #
      # @param name [String]
      #
      # @param add_security_recommendation [Boolean] Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
      #
      # @param buttons [Array<Zavudev::Models::TemplateCreateParams::Button>] Template buttons (max 3).
      #
      # @param code_expiration_minutes [Integer] Code expiration time in minutes. Only for AUTHENTICATION templates.
      #
      # @param footer [String] Footer text for the template.
      #
      # @param header_content [String] Header content (text string or media URL).
      #
      # @param header_type [Symbol, Zavudev::Models::TemplateCreateParams::HeaderType] Type of header for the template.
      #
      # @param instagram_body [String] Channel-specific body for Instagram. Falls back to `body` if not set.
      #
      # @param sms_body [String] Channel-specific body for SMS. Falls back to `body` if not set.
      #
      # @param telegram_body [String] Channel-specific body for Telegram. Falls back to `body` if not set.
      #
      # @param variables [Array<String>]
      #
      # @param whatsapp_category [Symbol, Zavudev::Models::WhatsappCategory] WhatsApp template category.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Template]
      #
      # @see Zavudev::Models::TemplateCreateParams
      def create(params)
        parsed, options = Zavudev::TemplateCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/templates",
          body: parsed,
          model: Zavudev::Template,
          options: options
        )
      end

      # Get template
      #
      # @overload retrieve(template_id, request_options: {})
      #
      # @param template_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Template]
      #
      # @see Zavudev::Models::TemplateRetrieveParams
      def retrieve(template_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/templates/%1$s", template_id],
          model: Zavudev::Template,
          options: params[:request_options]
        )
      end

      # List WhatsApp message templates for this project.
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String]
      # @param limit [Integer]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Template>]
      #
      # @see Zavudev::Models::TemplateListParams
      def list(params = {})
        parsed, options = Zavudev::TemplateListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/templates",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Template,
          options: options
        )
      end

      # Delete template
      #
      # @overload delete(template_id, request_options: {})
      #
      # @param template_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::TemplateDeleteParams
      def delete(template_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/templates/%1$s", template_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Submit a WhatsApp template to Meta for approval. The template must be in draft
      # status and associated with a sender that has a WhatsApp Business Account
      # configured.
      #
      # @overload submit(template_id, sender_id:, category: nil, request_options: {})
      #
      # @param template_id [String]
      #
      # @param sender_id [String] The sender ID with the WhatsApp Business Account to submit the template to.
      #
      # @param category [Symbol, Zavudev::Models::WhatsappCategory] Template category. If not provided, uses the category set on the template.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Template]
      #
      # @see Zavudev::Models::TemplateSubmitParams
      def submit(template_id, params)
        parsed, options = Zavudev::TemplateSubmitParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/templates/%1$s/submit", template_id],
          body: parsed,
          model: Zavudev::Template,
          options: options
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
