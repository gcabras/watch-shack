class Moviebookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :bookmark
  validates :movie_id, uniqueness: { scope: :bookmark_id }
end
