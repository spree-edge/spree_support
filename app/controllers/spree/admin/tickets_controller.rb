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
    end
  end
end

