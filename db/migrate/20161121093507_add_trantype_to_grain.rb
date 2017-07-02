class AddTrantypeToGrain < ActiveRecord::Migration[5.0]
  def change
    add_column :grains, :trantype, :string
  end
end
