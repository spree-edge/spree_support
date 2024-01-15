class CreateSpreeTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_tickets do |t|
      t.string :number
      t.string :title
      t.string :category
      t.text :description
      t.string :order_no
      t.string :status, default: 'open' # %w(open in_progress closed awaiting)
      t.string :priority
      t.string :customer_name
      t.string :email
      t.belongs_to :assignee, foreign_key: { to_table: :spree_users }
      t.belongs_to :store, foreign_key: { to_table: :spree_stores }
      t.belongs_to :user, foreign_key: { to_table: :spree_users }

      t.timestamps
    end
  end
end
