class Journal < ApplicationRecord
  belongs_to :user, optional: true
end
