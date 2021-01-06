class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.references :group, null: false, index: true
      t.boolean :is_rentaled
      t.bigint :category_id

      t.timestamps
    end
  end
end
