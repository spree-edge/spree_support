Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'add_support_tab_on_sidebar',
  insert_bottom: '[data-hook="admin_sidebar_div"]',
  text: <<-HTML
    <% if can? :admin, Spree::Ticket %>
      <ul class="nav nav-sidebar" id="sidebarSupport">
        <%= tab Spree.t(:support), url: admin_tickets_url, icon: "custom-support-icon.svg", match_path: '/tickets' %>
      </ul>
    <% end %>
  HTML
)
