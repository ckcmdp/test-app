class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.boolean :completed, default: false
      t.integer :created_by_id, null: false
      t.timestamps
    end

    add_foreign_key :tasks, :users, column: :created_by_id
  end
end
