class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :tags

  has_attached_file :attached_photo, styles: { large: "900x900", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attached_photo, content_type: /\Aimage\/.*\z/

  scope :six_most_recent, -> { order(created_at: :desc).limit(6) }
  scope :six_highest_rated, -> { order(avg_rating: :desc).limit(6) }

  def self.get_avg_rating(photo)
    total = 0
    photo.comments.each do |comment|
      total += comment.rating
    end
    return (total.to_f/photo.comments.length.to_f).round(1)
  end
end
