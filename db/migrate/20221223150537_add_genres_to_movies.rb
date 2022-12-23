class AddGenresToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :genres, :text, array: true, default: []
  end
end
