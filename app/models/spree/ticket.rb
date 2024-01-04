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
    has_many :conversations

    self.whitelisted_ransackable_associations = %w[conversations]
    self.whitelisted_ransackable_attributes = %w[number category order_no status priority customer_name email]
  end
end