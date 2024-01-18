class CreateSpreeConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_conversations do |t|
      t.text :message
      t.string :sender_name
      t.string :reciever_name
      t.belongs_to :ticket, foreign_key: { to_table: :spree_tickets }
      t.belongs_to :sender, foreign_key: { to_table: :spree_users }
      t.belongs_to :reciever, foreign_key: { to_table: :spree_users }

      t.timestamps
    end
  end
end
