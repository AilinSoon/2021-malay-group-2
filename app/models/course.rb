class Course < ApplicationRecord
  has_many :user_courses
  has_many :users, through: :user_courses
  has_many :reviews
  has_many :users, through: :reviews

  enum status: {
    Opening: 0,
    Started: 1,
    Finished: 2
  }

  scope :Opening, -> { where(status: 'Opening') }
  scope :Started, -> { where(status: 'Started') }
  scope :Finished, -> { where(status: 'Finished') }
end
