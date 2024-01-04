module Spree
  class Ticket < Spree::Base
    STATUS = %w(open in_progress closed awaiting).freeze
    PRIORITY = %w(high low medium).freeze

    include Spree::Core::NumberGenerator.new(prefix: 'T')
    include NumberIdentifier
    include NumberAsParam
    include SingleStoreResource

    with_options presence: true do
      validates :email, length: { maximum: 254 }
      validates :store_id, :title, :customer_name
    end

    belongs_to :store
    has_many :spree_conversations
  end
end