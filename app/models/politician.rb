class Politician < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  searchkick

  has_many :reviews
  belongs_to :user

  validates :first_name, :last_name, :wikipage, :image, presence: true
  validates :wikipage, format: { with: /\Ahttps?:\/\/.*\z/,
    message: "must start with http:// or https://" }

  def avg_rating
    @reviews = Review.where(politician_id: self.id)
    if @reviews.blank?
      0
    else
      @reviews.average(:rating).round(2)
    end
  end

  def name
    first_name + " " + last_name
  end
end
