class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions

  validates :text, presence: true, length: { maximum: 255 }

  scope :answered, -> { where.not(answer: nil) }
  scope :unanswered, -> { where(answer: nil) }

  after_save_commit :find_save_update_hashtags

  private

  def find_save_update_hashtags
    self.hashtags = "#{text} #{answer}".downcase.scan(Hashtag::TAG_STRING_REGEXP).uniq.map do |hashtag|
      Hashtag.find_or_create_by(name: hashtag.delete("#"))
    end
  end
end
