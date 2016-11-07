class Group < ApplicationRecord
  has_many :roles
  has_many :users, through: :roles
end
