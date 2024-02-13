module Spree
  module Admin
    module TicketsHelper

      def priority_tag(ticket)
        case ticket.priority
        when 'low'
          build_priority_tag('low', 'danger')
        when 'medium'
          build_priority_tag('medium', 'warning')
        when 'high'
          build_priority_tag('high', 'success')
        else
          build__default_priority_tag
        end
      end

      def status_tag(ticket)
        case ticket.status
        when 'open'
          build_status_tag('Open', 'success')
        when 'in_progress'
          build_status_tag('In Progress', 'warning')
        when 'closed'
          build_status_tag('Closed', 'danger')
        when 'awaiting'
          build_status_tag('Awaiting Response', 'info')
        end
      end

      private

      def build_priority_tag(priority, text_class)
        content_tag(:img, nil, alt: "#{priority} priority".titleize, width: '12px', height: '12px', src: image_path("backend-custom-#{priority}-priority.svg")
          ) << content_tag(:p, priority.titleize, class: "text-#{text_class} mb-0 ml-2") 
      end

      def build__default_priority_tag
        content_tag(:p, 'Not Define', class: 'text-info mb-0 ml-2') 
      end

      def build_status_tag(status, bg_class)
        content_tag(:p, status.titleize, class: "bg-#{bg_class} mb-0 bg-success rounded-pill py-1 px-2") 
      end
    end
  end
end
