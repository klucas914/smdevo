class Track < ApplicationRecord
  has_many :activities, dependent: :destroy
  accepts_nested_attributes_for :activities
end
