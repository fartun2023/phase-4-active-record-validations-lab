class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :title_must_be_clickbait
  
  private

  def title_must_be_clickbait
    clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
    if title.present? && !clickbait_phrases.any? { |phrase| title.include?(phrase) }
      errors.add(:title, "must be clickbait")
    end
  end
end
