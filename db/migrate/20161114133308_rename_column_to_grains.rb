class RenameColumnToGrains < ActiveRecord::Migration[5.0]
  def change
    rename_column :grains, :type, :variety
  end
end
