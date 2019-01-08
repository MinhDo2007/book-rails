class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :author
      t.string :name
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
