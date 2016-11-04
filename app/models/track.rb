class Track < ApplicationRecord
  has_many :activities, dependent: :destroy
end
