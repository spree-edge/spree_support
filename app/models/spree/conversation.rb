module Spree
  class Conversation < Spree::Base
    belongs_to :ticket
    has_many_attached :files, dependent: :destroy

    belongs_to :sender, class_name: 'Spree::User', foreign_key: 'sender_id'
    belongs_to :reciever, class_name: 'Spree::User', foreign_key: 'reciever_id'

    def support?
      sender_name.downcase.match?('support')
    end

    def extract_initials_sender_name
      sender_name.split.map { |word| word[0] }.join.upcase
    end
  end
end
