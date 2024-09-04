class CreateTaskAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :task_assignments do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :assigned_by_id
      t.timestamps
    end

    add_foreign_key :task_assignments, :users, column: :assigned_by_id
    add_foreign_key :task_assignments, :users
    add_foreign_key :task_assignments, :tasks
  end
end
