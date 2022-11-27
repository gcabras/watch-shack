class Movie < ApplicationRecord
  validates :title, :overview, uniqueness: true
  has_many :moviebookmarks
  has_many :bookmarks, through: :moviebookmarks
end
