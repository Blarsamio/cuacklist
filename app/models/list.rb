class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_many :reviews
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
end
