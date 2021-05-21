class Hashtag < ApplicationRecord
  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  validates :name, presence: true, length: { maximum: 255 }
end
