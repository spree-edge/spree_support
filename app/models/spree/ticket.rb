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
    belongs_to :assignee, class_name: 'Spree::User', foreign_key: 'assignee_id'
    belongs_to :user, class_name: 'Spree::User', foreign_key: 'user_id'
    
    has_many :conversations, dependent: :destroy
    has_many_attached :files, dependent: :destroy

    self.whitelisted_ransackable_associations = %w[conversations]
    self.whitelisted_ransackable_attributes = %w[number category order_no status priority customer_name email]

    def closed?
      status == 'closed'
    end

    def open?
      status == 'open'
    end
  end
end