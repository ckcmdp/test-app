class Task < ApplicationRecord
  has_many :task_assignments
  has_many :users, through: :task_assignments
  belongs_to :created_by, foreign_key: :created_by_id, class_name: 'User'
end
