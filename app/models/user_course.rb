class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :user_id, uniqueness: {scope: :course_id}

  enum status: {
    Pending: 0,
    Approved: 1,
    Denied: 2
  }

  scope :Pending, -> { where(status: 'Pending') }
  scope :Approved, -> { where(status: 'Approved') }
  scope :Denied, -> { where(status: 'Denied') }
end
