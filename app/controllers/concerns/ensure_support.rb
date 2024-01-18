module EnsureSupport
  extend ActiveSupport::Concern

  # filter for checking if this feature is enabled or not before running any controller action
  included do
    before_action :ensure_support_enabled
  end

  def ensure_support_enabled
    raise CanCan::AccessDenied unless Flipper.enabled?(:support, current_store.try(:id))
  end
end