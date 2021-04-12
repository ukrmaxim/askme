class Question < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: { maximum: 255 }

  scope :answered, -> { where(answer: nil) }
  scope :unanswered, -> { where.not(answer: nil) }
end
