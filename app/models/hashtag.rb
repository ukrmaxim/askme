class Hashtag < ApplicationRecord
  TAG_STRING_REGEXP = /#[[:word:]-]+/

  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  validates :name, presence: true, length: { maximum: 30 }

  scope :with_questions, -> { joins(:questions).distinct }

  def to_param
    name
  end
end
