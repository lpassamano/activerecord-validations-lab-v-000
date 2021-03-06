class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :must_be_clickbait

  def must_be_clickbait
    clickbait = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
    if clickbait.none? {|c| c.match title}
      errors.add(:title, "title must be clickbait")
    end
  end
end
