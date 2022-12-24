class AddActorsToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :actors, :text, array: true, default: []
  end
end
