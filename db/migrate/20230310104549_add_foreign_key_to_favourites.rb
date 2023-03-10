class AddForeignKeyToFavourites < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarks, :favourite, foreign_key: true
    add_reference :movies, :favourite, foreign_key: true
  end
end
