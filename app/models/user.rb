require 'bcrypt'

class User < ApplicationRecord
  has_secure_password

  has_many :task_assignments
  has_many :tasks, through: :task_assignments

  enum role: { admin: 0, member: 1 }

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
