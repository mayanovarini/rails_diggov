class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :politician
  after_create :send_review_email

  validates :rating, :comment, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: "can only be a whole number between 1 and 5"
  }

  def send_review_email
    NotificationMailer.review_added(self).deliver
  end
end
