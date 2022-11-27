class List < ApplicationRecord
  validates :name, uniqueness: true
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  belongs_to :user
end
