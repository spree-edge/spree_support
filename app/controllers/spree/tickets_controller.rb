module Spree
  class TicketsController < Spree::StoreController
    load_and_authorize_resource class: Spree::Ticket
    include EnsureSupport

    before_action :set_ticket, only: %i[ show conversations ]

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

    def conversations
      @message = @ticket.conversations.build(conversation_params)

      if @message.save
        respond_to do |format|
          format.html { redirect_to @ticket, notice: 'Message was successfully created.' }
          format.turbo_stream
        end
      else
        flash[:error] = @message.errors.full_messages.join(', ')
        redirect_to conversations_ticket_path(@ticket)
      end
    end

    private

    def set_ticket
      @ticket = Spree::Ticket.find_by(number: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:customer_name, :email, :phone_number, :title, :category, :order_no, :description, files: [])
    end

    def conversation_params
      params.require(:conversation).permit(:message, files: [])
    end
  end
end
