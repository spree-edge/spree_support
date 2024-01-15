module Spree
  class Conversation < Spree::Base
    belongs_to :ticket
    has_many_attached :files
  end
end