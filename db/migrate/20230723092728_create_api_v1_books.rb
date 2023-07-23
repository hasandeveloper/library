class CreateApiV1Books < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_books, id: :uuid  do |t|
      t.string :name
      t.text :description
      t.uuid :library_id, type: :uuid, references: :api_v1_libraries, foreign_key: { to_table: :api_v1_libraries}
      t.integer :stock, :default => 0
      t.timestamps
    end
    add_index :api_v1_books, :library_id
  end
end
