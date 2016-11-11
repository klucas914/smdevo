class Role < ApplicationRecord
  belongs_to :group
  belongs_to :user

  enum role_type: {
    teacher: 1,
    student: 2
  }

  validates :group, presence: true
  validates :user,  presence: true

end
