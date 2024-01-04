module Spree
  class Conversation < Spree::Base
    belongs_to :ticket
  end
end