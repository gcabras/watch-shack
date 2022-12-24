class AddDirectorsToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :directors, :text, array: true, default: []
  end
end
