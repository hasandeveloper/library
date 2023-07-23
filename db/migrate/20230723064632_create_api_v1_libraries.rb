class CreateApiV1Libraries < ActiveRecord::Migration[6.0]
  def change
    create_table :api_v1_libraries, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
