module Spree
  module Admin
    class TicketsController < ResourceController

      before_action :find_resource, only: [:conversations]

      def conversations
        if request.post?
          @message = @ticket.conversations.build(conversation_params)

          @message.sender_name = 'Support'
          @message.sender = spree_current_user

          @message.reciever_name = @ticket.customer_name
          @message.reciever = @ticket.user

          @message.save
        end
      end

      private

      def collection
        return @collection if @collection.present?

        params[:q] ||= {}
        params[:q][:s] ||= 'created_at asc'

        @collection = ticket_scope

        @search = @collection.ransack(params[:q])
        @collection = @search.result.
                      page(params[:page]).
                      per(params[:per_page] || Spree::Backend::Config[:admin_products_per_page])

        @collection
      end

      def ticket_scope
        current_store.tickets.accessible_by(current_ability, :index)
      end

      def find_resource
        if parent_data.present?
          parent.send(controller_name).find_by(number: params[:id])
        else
          base_scope = model_class.try(:for_store, current_store) || model_class
          base_scope.find_by(number: params[:id])
        end
      end

      def conversation_params
        params.require(:conversation).permit(:message, files: [])
      end
    end
  end
end
