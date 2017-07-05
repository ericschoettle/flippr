class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_attached_file :attached_photo, styles: { large: "900x900", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attached_photo, content_type: /\Aimage\/.*\z/

  scope :five_most_recent, -> { order(created_at: :desc).limit(5)}

end
