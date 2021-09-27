class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :content, presence: true, length: { maximum: 300 }
end
