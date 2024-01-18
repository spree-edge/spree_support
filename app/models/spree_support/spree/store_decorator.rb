module SpreeSupport
  module Spree
    module StoreDecorator
      def self.prepended(base)
        base.has_many :tickets
      end
    end
  end
end

::Spree::Store.prepend SpreeSupport::Spree::StoreDecorator
