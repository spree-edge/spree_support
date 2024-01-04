module Spree
  class TicketsController < Spree::StoreController
    before_action :set_ticket, only: %i[ show  ]

    def index
      @tickets = Spree::Ticket.all
    end

    def new
      @ticket = Spree::Ticket.new
    end

    def show
    end

    def create
      @ticket = current_store.tickets.new(ticket_params)

      respond_to do |format|
        if @ticket.save
          format.html { redirect_to tickets_url, notice: "ticket was successfully created." }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_ticket
      @ticket = Spree::Ticket.find_by(number: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit!
    end
  end
end
