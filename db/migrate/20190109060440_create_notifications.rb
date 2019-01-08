class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_book_id
      t.boolean :status, default: :false

      t.timestamps
    end
  end
end
