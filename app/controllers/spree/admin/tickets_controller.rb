module Spree
  module Admin
    class TicketsController < ResourceController

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
    end
  end
end
