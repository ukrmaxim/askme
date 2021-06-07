class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :hashtags, through: :hashtag_questions
  has_many :hashtag_questions, dependent: :destroy

  validates :text, presence: true, length: { maximum: 255 }

  scope :answered, -> { where.not(answer: nil) }
  scope :unanswered, -> { where(answer: nil) }

  after_save_commit :find_and_save_hashtags
  after_update_commit :delete_all_old_hashtags

  private

  def find_and_save_hashtags
    "#{text} #{answer}".scan(Hashtag::TAG_STRING_REGEXP).map(&:downcase).uniq.each do |hashtag|
      new_hashtag = Hashtag.find_or_create_by(name: hashtag.delete("#"))
      HashtagQuestion.create!(question: self, hashtag: new_hashtag)
    end
  end

  def delete_all_old_hashtags
    HashtagQuestion.where(question: self).destroy_all
  end
end
