module Spree
  module TicketsHelper

    def class_text_colour(ticket)
      case ticket.status
      when 'open'
        'text-danger'
      when 'in_progress'
        'text-info'
      when 'closed'
        'text-success'
      when 'awaiting'
        'text-primary'
      else
        'text-secondary'
      end
    end

    def add_border_inbetween(idx)
      @tickets.count != (idx + 1) ? 'border-bottom border-lightgray' : ''
     end
  end
end

