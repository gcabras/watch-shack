class Bookmark < ApplicationRecord
  belongs_to :list
  has_many :moviebookmarks, dependent: :destroy
  has_many :movies, through: :moviebookmarks
  validates :comment, length: { minimum: 6 }
end
