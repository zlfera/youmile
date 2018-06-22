class AddIndexToGrainsMarkNumber < ActiveRecord::Migration[5.2]
  def change
    add_index :grains, :mark_number, unique: true 
  end
end
