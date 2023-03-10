class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list, optional: true
  belongs_to :favourite, optional: true

  validates :movie_id, uniqueness: {scope: :list_id, message: "is already in the list"}
end
