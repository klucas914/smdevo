class Post < ApplicationRecord
  belongs_to :journal, dependent: :destroy
end
