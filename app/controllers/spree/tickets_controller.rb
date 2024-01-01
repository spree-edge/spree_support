module Spree
  class TicketsController < Spree::StoreController
    before_action :set_ticket, only: %i[ show edit update destroy ]

    def index
      @tickets = Spree::Ticket.all
    end

    def new
      @ticket = Spree::Ticket.new
    end

    def edit
    end

    def show
    end

    def create
      @ticket = Spree::Ticket.new(ticket_params)

      respond_to do |format|
        if @ticket.save
          format.html { redirect_to ticket_url(@ticket), notice: "ticket was successfully created." }
          format.json { render :show, status: :created, location: @ticket }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @ticket.update(ticket_params)
          format.html { redirect_to ticket_url(@ticket), notice: "ticket was successfully updated." }
          format.json { render :show, status: :ok, location: @ticket }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @ticket.destroy

      respond_to do |format|
        format.html { redirect_to tickets_url, notice: "ticket was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_ticket
      @ticket = Spree::Ticket.find(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:title, :category, :order_no, :description)
    end
  end
end
