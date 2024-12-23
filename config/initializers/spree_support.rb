Rails.application.config.after_initialize do
  if Spree::Core::Engine.backend_available?
    Rails.application.config.spree_backend.main_menu.add_to_section(
      'integrations',
      ::Spree::Admin::MainMenu::ItemBuilder.new(
        'support',
        ::Spree::Core::Engine.routes.url_helpers.admin_tickets_path
      )
      .with_icon_key('custom-support-icon.svg')
      .with_match_path('/tickets')
      .build
    )
  end
end
