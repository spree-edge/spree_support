class CreateSpreeConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_conversations do |t|
      t.text :message
      t.string :sender
      t.string :sender_email
      t.string :reciever
      t.string :reciever_email
      t.belongs_to :ticket, foreign_key: { to_table: :spree_tickets }

      t.timestamps
    end
  end
end
