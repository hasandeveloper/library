class CreateApiV1Orders < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_orders, id: :uuid  do |t|
      t.uuid :book_id, type: :uuid, references: :api_v1_books, foreign_key: { to_table: :api_v1_books}
      t.uuid :user_id, type: :uuid, references: :users, foreign_key: { to_table: :users}
      t.integer :qty
      t.timestamps
    end
  end
end
