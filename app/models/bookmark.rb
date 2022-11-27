class Bookmark < ApplicationRecord
  belongs_to :list
  has_many :moviebookmarks
  has_many :movies, through: :moviebookmarks
  validates :comment, length: { minimum: 6 }
end
