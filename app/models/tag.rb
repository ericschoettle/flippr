class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :photo
end