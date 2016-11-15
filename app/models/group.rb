class Group < ApplicationRecord
  has_many :roles
  has_many :users, through: :roles
  has_many :posts
  has_many :selections
  has_many :tracks, through: :selections
end
