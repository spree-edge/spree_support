module SpreeSupport
  module Spree
    module UserDecorator
      def self.prepended(base)
        base.has_many :tickets
      end
    end
  end
end

::Spree::User.prepend SpreeSupport::Spree::UserDecorator
