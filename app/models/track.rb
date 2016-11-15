class Track < ApplicationRecord
  has_many :activities, dependent: :destroy
  accepts_nested_attributes_for :activities
  has_many :selections
  has_many :groups, through: :selections
end
