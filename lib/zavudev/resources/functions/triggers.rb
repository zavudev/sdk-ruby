# frozen_string_literal: true

module Zavudev
  module Resources
    class Functions
      class Triggers
        # Some parameter documentations has been truncated, see
        # {Zavudev::Models::Functions::TriggerCreateParams} for more details.
        #
        # Subscribe a function to one or more event types, optionally scoped to specific
        # senders. Provide eventTypes and senderIds (use null in senderIds for all
        # senders); a trigger is created for each event type and sender combination.
        #
        # The special event type `cron` runs the function on a schedule instead of a
        # messaging event: include a `cron` field with a 5-field UTC cron expression
        # (minimum granularity one minute). A cron trigger ignores the sender axis, and a
        # function may hold several cron triggers with different expressions. The function
        # receives an event with `type: "cron"` and `data.cron`.
        #
        # @overload create(function_id, event_types:, sender_ids:, cron: nil, request_options: {})
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param event_types [Array<String>] Event types to subscribe to.
        #
        # @param sender_ids [Array<String, nil>] Senders to scope the triggers to. Use null for all senders.
        #
        # @param cron [String] Required when eventTypes includes `cron`: a 5-field cron expression (minute hour
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Functions::TriggerCreateResponse]
        #
        # @see Zavudev::Models::Functions::TriggerCreateParams
        def create(function_id, params)
          parsed, options = Zavudev::Functions::TriggerCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/functions/%1$s/triggers", function_id],
            body: parsed,
            model: Zavudev::Models::Functions::TriggerCreateResponse,
            options: options
          )
        end

        # Enable or disable a trigger
        #
        # @overload update(trigger_id, active:, request_options: {})
        #
        # @param trigger_id [String]
        # @param active [Boolean]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Functions::TriggerUpdateResponse]
        #
        # @see Zavudev::Models::Functions::TriggerUpdateParams
        def update(trigger_id, params)
          parsed, options = Zavudev::Functions::TriggerUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["v1/functions/triggers/%1$s", trigger_id],
            body: parsed,
            model: Zavudev::Models::Functions::TriggerUpdateResponse,
            options: options
          )
        end

        # List function triggers
        #
        # @overload list(function_id, request_options: {})
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Functions::TriggerListResponse]
        #
        # @see Zavudev::Models::Functions::TriggerListParams
        def list(function_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/functions/%1$s/triggers", function_id],
            model: Zavudev::Models::Functions::TriggerListResponse,
            options: params[:request_options]
          )
        end

        # Delete a trigger
        #
        # @overload delete(trigger_id, request_options: {})
        #
        # @param trigger_id [String]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Functions::TriggerDeleteParams
        def delete(trigger_id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/functions/triggers/%1$s", trigger_id],
            model: NilClass,
            options: params[:request_options]
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
end
